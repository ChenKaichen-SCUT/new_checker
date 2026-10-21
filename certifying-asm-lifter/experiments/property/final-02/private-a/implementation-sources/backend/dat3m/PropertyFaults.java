package certifying;

import com.dat3m.dartagnan.expression.Expression;
import com.dat3m.dartagnan.expression.ExpressionFactory;
import com.dat3m.dartagnan.expression.type.IntegerType;
import com.dat3m.dartagnan.program.event.Event;
import com.dat3m.dartagnan.program.event.core.*;
import com.dat3m.dartagnan.program.memory.MemoryObject;
import com.dat3m.dartagnan.verification.Task;
import org.sosy_lab.java_smt.api.BooleanFormula;
import org.sosy_lab.java_smt.api.BooleanFormulaManager;

/** Test-only actual Program mutations. Positive executable never contains this. */
public final class PropertyFaults {
    private static Expression address(Event e) {
        if (e instanceof Load l) return l.getAddress();
        if (e instanceof Store s) return s.getAddress();
        return null;
    }
    private static void omit(RMWStore s) {
        var r = s.getLoadEvent();
        if (!s.tryDelete()) throw new IllegalStateException("Cannot remove actual store");
        var v = r.getResultRegister();
        var replacement = new Local(v, ExpressionFactory.getInstance().makeOne((IntegerType)v.getType()));
        replacement.copyAllMetadataFrom(r);
        replacement.setGlobalId(r.getGlobalId()); replacement.setLocalId(r.getLocalId());
        r.replaceBy(replacement);
    }
    public static void apply(Task task) {
        String mode = System.getProperty("cert.controlled.fault");
        if (mode == null) throw new IllegalStateException("Explicit mutation required");
        Snapshot.write(task, "pre-fault");
        RMWStore owned = null, shared = null;
        var threads = task.getProgram().getThreads();
        for (var t : threads) for (var s : t.getEvents(RMWStore.class)) {
            if (!(s.getAddress() instanceof MemoryObject o) || o.getName().startsWith("__com_")) continue;
            boolean other = threads.stream().anyMatch(u -> u != t && u.getEvents().stream()
                    .anyMatch(e -> !(e instanceof Init) && o.equals(address(e))));
            if (other && shared == null) shared = s;
            if (!other && owned == null) owned = s;
        }
        if (owned == null || shared == null) throw new IllegalStateException("Both owner and observed object required");
        var ef = ExpressionFactory.getInstance();
        switch (mode) {
            case "pd-private-value" -> {
                var r = owned.getLoadEvent().getResultRegister();
                owned.setMemValue(ef.makeAdd(r, ef.makeOne((IntegerType)r.getType())));
            }
            case "pd-public-value" -> shared.setMemValue(shared.getLoadEvent().getResultRegister());
            case "pd-private-a" -> { owned.removeTags("A"); owned.getLoadEvent().removeTags("A"); }
            case "pd-private-omit" -> omit(owned);
            case "pd-sync-omit" -> {
                var ownerStore = owned;
                var completion = threads.stream().filter(t -> t.getEvents().contains(ownerStore))
                        .flatMap(t -> t.getEvents(RMWStore.class).stream())
                        .filter(s -> s.getAddress() instanceof MemoryObject o && o.getName().startsWith("__com_"))
                        .findFirst().orElseThrow();
                omit(completion);
            }
            default -> throw new IllegalStateException("Unknown property fault " + mode);
        }
        Snapshot.write(task, "post-fault");
    }
    public static BooleanFormula assumption(BooleanFormula original, BooleanFormulaManager bmgr) { return original; }
}
