package certifying;

import com.dat3m.dartagnan.configuration.Property;
import com.dat3m.dartagnan.encoding.EncodingContext;
import com.dat3m.dartagnan.program.event.Tag;
import com.dat3m.dartagnan.program.event.RegWriter;
import com.dat3m.dartagnan.program.event.core.*;
import com.dat3m.dartagnan.smt.ProverWithTracker;
import com.dat3m.dartagnan.verification.VerificationTask;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.sosy_lab.java_smt.api.*;
import java.nio.file.*;
import java.util.*;

/** Read-only records of the actual formulas, task and return values of solver calls.
 * Never adds constraints, chooses a property, or invokes an additional solver query.
 * An exception/UNKNOWN leaves an incomplete record, which cannot authorize SAFE.
 */
public final class P0Audit {
    private static VerificationTask task;
    private static EncodingContext context;
    private static FormulaManager fmgr;
    private static final Map<String,Object> data = new LinkedHashMap<>();
    private static final Map<String,Object> components = new LinkedHashMap<>();
    private static final List<Map<String,Object>> queries = new ArrayList<>();
    private static final List<Map<String,Object>> monitors = new ArrayList<>();
    private static Path destination;

    private static String dump(BooleanFormula f) { return fmgr.dumpFormula(f).toString(); }
    private static void save() {
        try {
            new ObjectMapper().writerWithDefaultPrettyPrinter().writeValue(destination.toFile(), data);
        } catch (Exception ex) { throw new IllegalStateException("P0 audit write failed", ex); }
    }

    public static void begin(VerificationTask t, EncodingContext c, FormulaManager f) {
        if (task != null || c.getTask() != t) throw new IllegalStateException("P0 task identity");
        task=t; context=c; fmgr=f;
        destination=Path.of(System.getProperty("cert.snapshot.dir"), "query-audit.json");
        if (Files.exists(destination)) throw new IllegalStateException("Stale P0 audit");
        data.put("format", "dat3m-p0-query-audit-v1");
        data.put("run_id", System.getProperty("cert.run.id"));
        data.put("program_identity", System.identityHashCode(t.getProgram()));
        data.put("properties", t.getProperties().stream().map(Enum::name).sorted().toList());
        data.put("combined_type", Property.getCombinedType(t.getProperties(), t).name());
        data.put("specification_type", t.getProgram().getSpecificationType().name());
        data.put("bound_events", t.getProgram().getThreadEvents().stream()
                .filter(e -> e.hasTag(Tag.BOUND)).map(e -> e.getGlobalId()).toList());
        data.put("components", components);
        data.put("queries", queries);
        data.put("monitors", monitors);
        data.put("completed", false);
        for (var a : t.getProgram().getThreadEvents(Assert.class)) {
            Map<String,Object> m=new LinkedHashMap<>();
            m.put("event",a.getGlobalId());
            m.put("execution",dump(c.execution(a)));
            m.put("condition",dump(c.getExpressionEncoder()
                    .encodeBooleanAt(a.getExpression(),a).formula()));
            monitors.add(m);
        }
        save();
    }

    /** Returns the identical Formula object to preserve the original solver call. */
    public static BooleanFormula component(String name, BooleanFormula formula) {
        if (components.putIfAbsent(name, dump(formula)) != null)
            throw new IllegalStateException("Duplicate P0 component");
        save();
        return formula;
    }

    public static void start(String stage, Collection<BooleanFormula> assumptions) {
        if (!queries.isEmpty() && !queries.get(queries.size()-1).containsKey("result"))
            throw new IllegalStateException("Previous query incomplete");
        Map<String,Object> q=new LinkedHashMap<>();
        q.put("index",queries.size()); q.put("stage",stage);
        q.put("assumptions",assumptions.stream().map(P0Audit::dump).toList());
        q.put("state","STARTED"); queries.add(q); save();
    }

    /** Records the boolean actually returned by the original call, not log text. */
    public static void finish(boolean unsat, ProverWithTracker prover) throws SolverException {
        Map<String,Object> q=queries.get(queries.size()-1);
        if (q.containsKey("result")) throw new IllegalStateException("Repeated query result");
        q.put("result",unsat ? "UNSAT" : "SAT"); q.put("state","COMPLETED");
        if (!unsat && q.get("stage").equals("safety")) {
            try (Model model=prover.getModel()) {
                List<Object> values=new ArrayList<>();
                for (var t : task.getProgram().getThreads()) for (var e : t.getEvents()) {
                    Map<String,Object> row=new LinkedHashMap<>();
                    row.put("event",e.getGlobalId());
                    row.put("executed",model.evaluate(context.execution(e)));
                    if (e instanceof Assert a)
                        row.put("condition",model.evaluate(context.getExpressionEncoder()
                                .encodeBooleanAt(a.getExpression(),a).formula()));
                    if (e instanceof RegWriter w)
                        row.put("written_value",String.valueOf(model.evaluate(context.result(w).formula())));
                    if (e instanceof Store s)
                        row.put("store_value",String.valueOf(model.evaluate(context.getExpressionEncoder()
                                .encodeAt(s.getMemValue(),s).formula())));
                    values.add(row);
                }
                q.put("actual_model_values",values);
                q.put("actual_model_text",model.toString());
            }
        }
        save();
    }

    public static void complete(String result) {
        if (task == null || queries.isEmpty() || queries.stream().anyMatch(q -> !q.containsKey("result")))
            throw new IllegalStateException("Incomplete P0 solver sequence");
        data.put("solver_result",result);
        data.put("completed",true); save();
    }
}
