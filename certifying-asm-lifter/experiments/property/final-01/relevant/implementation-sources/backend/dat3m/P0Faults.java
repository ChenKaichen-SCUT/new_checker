package certifying;

import com.dat3m.dartagnan.program.event.core.Assert;
import com.dat3m.dartagnan.program.event.core.threading.ThreadJoin;
import com.dat3m.dartagnan.verification.Task;
import org.sosy_lab.java_smt.api.BooleanFormula;
import org.sosy_lab.java_smt.api.BooleanFormulaManager;

/** Test-only: mutates actual objects before analysis, or the actual assumption.
 * This class is NEVER installed in a positive P0 build.
 */
public final class P0Faults {
    public static void apply(Task task) {
        String mode=System.getProperty("cert.controlled.fault");
        if (mode==null) throw new IllegalStateException("P0 negative build needs a fault");
        Snapshot.write(task,"pre-fault");
        var main=task.getProgram().getThreads().stream()
                .filter(t -> t.getName().equals("main")).findFirst().orElseThrow();
        switch(mode) {
            case "main-assert-omission" -> {
                var user=main.getEvents(Assert.class).stream()
                        .filter(a -> !a.getErrorMessage().equals("Invalid thread id in pthread_join.")).toList();
                if (user.size()!=1 || !user.get(0).tryDelete())
                    throw new IllegalStateException("Expected one removable main user assertion");
            }
            case "join-association" -> {
                var joins=main.getEvents(ThreadJoin.class);
                if (joins.size()!=2) throw new IllegalStateException("Expected two joins");
                joins.get(0).setJoinThread(joins.get(1).getJoinThread());
            }
            case "safety-query-binding" -> { /* actual query mutation occurs below */ }
            default -> throw new IllegalStateException("Unknown P0 fault");
        }
        Snapshot.write(task,"post-fault");
    }

    public static BooleanFormula assumption(BooleanFormula original, BooleanFormulaManager bmgr) {
        return "safety-query-binding".equals(System.getProperty("cert.controlled.fault"))
                ? bmgr.makeFalse() : original;
    }
}
