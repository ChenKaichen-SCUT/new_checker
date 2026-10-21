package certifying;

import com.dat3m.dartagnan.expression.Expression;
import com.dat3m.dartagnan.expression.ExpressionFactory;
import com.dat3m.dartagnan.expression.processing.ExprTransformer;
import com.dat3m.dartagnan.expression.type.IntegerType;
import com.dat3m.dartagnan.program.Register;
import com.dat3m.dartagnan.program.event.Event;
import com.dat3m.dartagnan.program.event.core.*;
import com.dat3m.dartagnan.program.memory.MemoryObject;
import com.dat3m.dartagnan.verification.Task;
import org.sosy_lab.java_smt.api.BooleanFormula;
import org.sosy_lab.java_smt.api.BooleanFormulaManager;

/** Separate P1b negative build. Mutations are to the same actual Program. */
public final class P1bFaults {
    private static void replace(Event old, Event replacement) {
        replacement.copyAllMetadataFrom(old);
        replacement.setGlobalId(old.getGlobalId());
        replacement.setLocalId(old.getLocalId());
        old.replaceBy(replacement);
    }

    private static void omit(RMWStore store) {
        var load = store.getLoadEvent();
        if (!store.tryDelete()) throw new IllegalStateException("Cannot remove actual store");
        var reg = load.getResultRegister();
        replace(load, new Local(reg, ExpressionFactory.getInstance().makeOne((IntegerType)reg.getType())));
    }

    public static void apply(Task task) {
        String mode = System.getProperty("cert.controlled.fault");
        if (mode == null) throw new IllegalStateException("Explicit fault required");
        Snapshot.write(task, "pre-fault");
        var workers = task.getProgram().getThreads().stream()
                .filter(t -> t.getName().equals("worker")).toList();
        if (workers.size() != 2) throw new IllegalStateException("Two workers required");
        var worker = workers.get(0);
        var stores = worker.getEvents(RMWStore.class).stream()
                .filter(e -> e.getAddress() instanceof MemoryObject o && o.getName().equals("x")).toList();
        if (stores.size() != 2) throw new IllegalStateException("Two user calls required");
        var first = stores.get(0).getLoadEvent().getResultRegister();
        var second = stores.get(1).getLoadEvent().getResultRegister();
        var ef = ExpressionFactory.getInstance();
        switch (mode) {
            case "swap-returns" -> {
                var swap = new ExprTransformer() {
                    @Override public Expression visitRegister(Register r) {
                        return r == first ? second : r == second ? first : r;
                    }
                };
                for (var a : worker.getEvents(Assert.class)) a.transformExpressions(swap);
            }
            case "second-operand" -> stores.get(1).setMemValue(
                    ef.makeAdd(second, ef.makeOne((IntegerType)second.getType())));
            case "omit-call" -> {
                for (var t : workers) {
                    var ss = t.getEvents(RMWStore.class).stream()
                            .filter(e -> e.getAddress() instanceof MemoryObject o && o.getName().equals("x")).toList();
                    if (ss.size() != 2) throw new IllegalStateException("Second source call absent already");
                    omit(ss.get(1));
                }
            }
            case "omit-activation" -> {
                var ss = workers.get(1).getEvents(RMWStore.class).stream()
                        .filter(e -> e.getAddress() instanceof MemoryObject o && o.getName().equals("x")).toList();
                if (ss.size() != 2) throw new IllegalStateException("Second activation absent already");
                omit(ss.get(1));
            }
            case "cross-read" -> {
                var reads = worker.getEvents(Load.class).stream().filter(e ->
                        e.getAddress() instanceof MemoryObject o && o.getName().equals("x") && !e.hasTag("RMW")).toList();
                if (reads.size() != 2) throw new IllegalStateException("Two ordinary reads required");
                var r = reads.get(1);
                replace(r, new Local(r.getResultRegister(), ef.makeOne((IntegerType)r.getResultRegister().getType())));
            }
            case "continuation-assert" -> {
                var aa = worker.getEvents(Assert.class);
                if (aa.size() != 3) throw new IllegalStateException("Three user monitors required");
                var a = aa.get(1);
                replace(a, new Assert(ef.makeNot(a.getExpression()), a.getErrorMessage()));
            }
            case "safety-query-binding" -> { }
            default -> throw new IllegalStateException("Unknown P1b fault " + mode);
        }
        Snapshot.write(task, "post-fault");
    }

    public static BooleanFormula assumption(BooleanFormula original, BooleanFormulaManager bmgr) {
        return "safety-query-binding".equals(System.getProperty("cert.controlled.fault"))
                ? bmgr.makeFalse() : original;
    }
}
