package certifying;

import com.dat3m.dartagnan.expression.Expression;
import com.dat3m.dartagnan.expression.ExpressionFactory;
import com.dat3m.dartagnan.expression.processing.ExprTransformer;
import com.dat3m.dartagnan.expression.type.IntegerType;
import com.dat3m.dartagnan.expression.misc.ITEExpr;
import com.dat3m.dartagnan.program.Register;
import com.dat3m.dartagnan.program.event.Event;
import com.dat3m.dartagnan.program.event.core.*;
import com.dat3m.dartagnan.program.event.core.threading.ThreadCreate;
import com.dat3m.dartagnan.program.memory.MemoryObject;
import com.dat3m.dartagnan.verification.Task;
import org.sosy_lab.java_smt.api.BooleanFormula;
import org.sosy_lab.java_smt.api.BooleanFormulaManager;

/** Test-only changes to actual pre-encoding Program objects. Not in positive jar. */
public final class LevelsFaults {
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
                .filter(t -> t.getName().equals("worker") || t.getName().equals("worker_other")).toList();
        if (workers.size() != 2) throw new IllegalStateException("Two actual activations required");
        var worker = workers.get(0);
        var stores = worker.getEvents(RMWStore.class).stream()
                .filter(e -> e.getAddress() instanceof MemoryObject o && o.getName().equals("x")).toList();
        var reads = worker.getEvents(Load.class).stream().filter(e -> !e.hasTag("RMW")
                && e.getAddress() instanceof MemoryObject o && !o.getName().startsWith("__com_")).toList();
        if (stores.isEmpty() || reads.isEmpty()) throw new IllegalStateException("User RMW/input required");
        var store = stores.get(0);
        var old = store.getLoadEvent().getResultRegister();
        var ef = ExpressionFactory.getInstance();
        switch (mode) {
            case "ite-swap" -> {
                var swap = new ExprTransformer() {
                    @Override public Expression visitITEExpression(ITEExpr e) {
                        return new ITEExpr(e.getCondition(), e.getFalseCase(), e.getTrueCase());
                    }
                };
                for (var e : worker.getEvents(Local.class)) e.transformExpressions(swap);
                for (var e : worker.getEvents(Store.class)) e.transformExpressions(swap);
                for (var e : worker.getEvents(Assert.class)) e.transformExpressions(swap);
            }
            case "ite-missing-dependency", "ite-wrong-type", "ite-truncated" -> { }
            case "rmw-tag-only" -> {
                store.removeTags("RMW");
                store.getLoadEvent().removeTags("RMW");
            }
            case "thread-argument" -> {
                var main = task.getProgram().getThreads().stream().filter(t -> t.getName().equals("main")).findFirst().orElseThrow();
                var cs = main.getEvents(ThreadCreate.class);
                if (cs.size() != 2) throw new IllegalStateException("Two creators required");
                cs.get(0).getArguments().set(0, cs.get(1).getArguments().get(0));
            }
            case "input-alias" -> reads.get(0).setAddress(store.getAddress());
            case "entry-ssa" -> store.setMemValue(ef.makeAdd(old, old));
            case "operand-only" -> store.setMemValue(ef.makeAdd(old, ef.makeOne((IntegerType)old.getType())));
            case "a-only" -> {
                store.removeTags("A");
                store.getLoadEvent().removeTags("A");
            }
            case "live-use-only" -> {
                var wrong = reads.get(0).getResultRegister();
                var transform = new ExprTransformer() {
                    @Override public Expression visitRegister(Register r) { return r == old ? wrong : r; }
                };
                for (var a : worker.getEvents(Assert.class)) a.transformExpressions(transform);
            }
            case "omit-worker-call", "omit-activation" -> {
                var ss = workers.get(1).getEvents(RMWStore.class).stream()
                        .filter(e -> e.getAddress() instanceof MemoryObject o && o.getName().equals("x")).toList();
                omit(ss.get(ss.size() - 1));
            }
            case "omit-call" -> {
                for (var t : workers) {
                    var ss = t.getEvents(RMWStore.class).stream()
                            .filter(e -> e.getAddress() instanceof MemoryObject o && o.getName().equals("x")).toList();
                    if (ss.size() != 2) throw new IllegalStateException("Two calls required");
                    omit(ss.get(1));
                }
            }
            case "swap-returns" -> {
                if (stores.size() != 2) throw new IllegalStateException("Two calls required");
                var second = stores.get(1).getLoadEvent().getResultRegister();
                var swap = new ExprTransformer() {
                    @Override public Expression visitRegister(Register r) {
                        return r == old ? second : r == second ? old : r;
                    }
                };
                for (var a : worker.getEvents(Assert.class)) a.transformExpressions(swap);
            }
            case "second-operand" -> {
                if (stores.size() != 2) throw new IllegalStateException("Two calls required");
                var second = stores.get(1).getLoadEvent().getResultRegister();
                stores.get(1).setMemValue(ef.makeAdd(second, ef.makeOne((IntegerType)second.getType())));
            }
            case "cross-read" -> {
                if (reads.size() != 2) throw new IllegalStateException("Two input reads required");
                var r = reads.get(1);
                replace(r, new Local(r.getResultRegister(), ef.makeOne((IntegerType)r.getResultRegister().getType())));
            }
            case "assert-only", "continuation-assert" -> {
                var aa = worker.getEvents(Assert.class);
                var a = aa.get(mode.equals("continuation-assert") ? 1 : 0);
                replace(a, new Assert(ef.makeNot(a.getExpression()), a.getErrorMessage()));
            }
            case "safety-query-binding" -> { }
            default -> throw new IllegalStateException("Unknown P2 fault " + mode);
        }
        Snapshot.write(task, "post-fault");
    }

    public static BooleanFormula assumption(BooleanFormula original, BooleanFormulaManager bmgr) {
        return "safety-query-binding".equals(System.getProperty("cert.controlled.fault"))
                ? bmgr.makeFalse() : original;
    }
}
