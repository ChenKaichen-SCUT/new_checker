package certifying;

import com.dat3m.dartagnan.expression.ExpressionFactory;
import com.dat3m.dartagnan.expression.integers.IntBinaryExpr;
import com.dat3m.dartagnan.program.event.core.*;
import com.dat3m.dartagnan.program.memory.MemoryObject;
import com.dat3m.dartagnan.verification.Task;
import org.sosy_lab.java_smt.api.BooleanFormula;
import org.sosy_lab.java_smt.api.BooleanFormulaManager;

/** Test-only actual-object mutations, before analyses. Never in positive build. */
public final class P1Faults {
    public static void apply(Task task) {
        String mode = System.getProperty("cert.controlled.fault");
        if (mode == null) throw new IllegalStateException("Explicit fault required");
        Snapshot.write(task, "pre-fault");
        var worker = task.getProgram().getThreads().stream()
                .filter(t -> t.getName().equals("worker")).findFirst().orElseThrow();
        var stores = worker.getEvents(RMWStore.class).stream()
                .filter(e -> e.getAddress() instanceof MemoryObject o && o.getName().equals("x")).toList();
        if (stores.size() != 1) throw new IllegalStateException("P1a fault requires one user RMW");
        var store = stores.get(0);
        var ef = ExpressionFactory.getInstance();
        var old = store.getLoadEvent().getResultRegister();
        switch (mode) {
            // Same ADD and true pairing. Only the entry operand points at the
            // wrong actual definition (the RMW read, rather than ordinary read).
            case "entry-ssa" -> store.setMemValue(ef.makeAdd(old, old));
            // Only the increment expression changes to a fixed literal.
            case "operand-only" -> store.setMemValue(ef.makeAdd(old, ef.makeOne(old.getType())));
            case "assert-only" -> {
                var assertions = worker.getEvents(Assert.class);
                if (assertions.size() != 1) throw new IllegalStateException("One worker monitor required");
                var a = assertions.get(0);
                var b = new Assert(ef.makeNot(a.getExpression()), a.getErrorMessage());
                b.copyAllMetadataFrom(a);
                b.addTags(a.getTags());
                b.setGlobalId(a.getGlobalId());
                b.setLocalId(a.getLocalId());
                a.replaceBy(b);
            }
            case "safety-query-binding" -> { }
            default -> throw new IllegalStateException("Unknown P1 fault " + mode);
        }
        Snapshot.write(task, "post-fault");
    }

    public static BooleanFormula assumption(BooleanFormula original, BooleanFormulaManager bmgr) {
        return "safety-query-binding".equals(System.getProperty("cert.controlled.fault"))
                ? bmgr.makeFalse() : original;
    }
}
