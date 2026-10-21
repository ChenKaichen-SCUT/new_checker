package certifying;

import com.dat3m.dartagnan.expression.ExpressionFactory;
import com.dat3m.dartagnan.program.event.Event;
import com.dat3m.dartagnan.program.event.Tag;
import com.dat3m.dartagnan.program.event.core.*;
import com.dat3m.dartagnan.program.memory.MemoryObject;
import com.dat3m.dartagnan.verification.Task;
import java.util.*;

/** Test-only actual Program mutations, BEFORE static analyses and encoding.
 * Not installed in the positive backend. No mutation of serialized JSON.
 */
public final class ControlledFaults {
    private ControlledFaults() {}

    private static void replace(Event old, Event replacement) {
        replacement.copyAllMetadataFrom(old);
        replacement.addTags(old.getTags());
        replacement.setGlobalId(old.getGlobalId());
        replacement.setLocalId(old.getLocalId());
        old.replaceBy(replacement);
    }

    public static void apply(Task task) {
        String mode = System.getProperty("cert.controlled.fault");
        if (mode == null) throw new IllegalStateException("Fault build requires explicit fault mode");
        Snapshot.write(task, "pre-fault");
        var workers = task.getProgram().getThreads().stream()
                .filter(t -> t.getName().equals("worker")).toList();
        if (workers.isEmpty()) throw new IllegalStateException("No controlled workers");
        var worker = workers.get(0);
        var memory = worker.getEvents().stream().filter(e ->
                e instanceof MemoryCoreEvent m && m.getAddress() instanceof MemoryObject o
                        && o.getName().equals("x")).toList();
        if (memory.size() != 2 || !(memory.get(0) instanceof Load)
                || !(memory.get(1) instanceof RMWStore)) {
            throw new IllegalStateException("Fault selector requires the exact controlled RMW");
        }
        Load load = (Load) memory.get(0);
        RMWStore store = (RMWStore) memory.get(1);
        switch (mode) {
            case "a-only" -> load.removeTags("A");
            case "pair-only" -> {
                if (workers.size() != 2) throw new IllegalStateException("Pair fault needs two workers");
                Load other = workers.get(workers.size() - 1).getEvents(Load.class).stream()
                        .filter(l -> l.getAddress() instanceof MemoryObject o && o.getName().equals("x"))
                        .findFirst().orElseThrow();
                store.updateReferences(Map.of(load, other));
            }
            case "guard-only" -> {
                var jumps = worker.getEvents(CondJump.class);
                if (jumps.size() != 1) throw new IllegalStateException("Expected one CAS branch");
                CondJump jump = jumps.get(0);
                jump.setGuard(ExpressionFactory.getInstance().makeNot(jump.getGuard()));
            }
            case "live-use-only" -> {
                var assertions = worker.getEvents(Assert.class);
                if (assertions.size() != 1) throw new IllegalStateException("Expected one live assertion");
                Assert assertion = assertions.get(0);
                replace(assertion, new Assert(ExpressionFactory.getInstance().makeNot(assertion.getExpression()),
                        assertion.getErrorMessage()));
            }
            case "omit-instance" -> {
                if (workers.size() != 2) throw new IllegalStateException("Omission needs two workers");
                var omitted = workers.get(workers.size() - 1).getEvents().stream().filter(e ->
                        e instanceof MemoryCoreEvent m && m.getAddress() instanceof MemoryObject o
                                && o.getName().equals("x")).toList();
                if (omitted.size() != 2 || !(omitted.get(0) instanceof Load)
                        || !(omitted.get(1) instanceof RMWStore)) {
                    throw new IllegalStateException("Expected two events in omitted instance");
                }
                // Reverse order unregisters the store's use of the load first.
                for (int i = omitted.size() - 1; i >= 0; i--) {
                    Event e = omitted.get(i);
                    if (!e.tryDelete()) throw new IllegalStateException("Cannot safely detach selected event");
                }
            }
            default -> throw new IllegalStateException("Unknown controlled fault " + mode);
        }
        Snapshot.write(task, "post-fault");
        System.out.println("CONTROLLED_ACTUAL_PROGRAM_FAULT=" + mode);
    }
}
