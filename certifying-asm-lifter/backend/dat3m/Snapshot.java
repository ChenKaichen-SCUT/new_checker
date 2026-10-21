package certifying;

import com.dat3m.dartagnan.configuration.Arch;
import com.dat3m.dartagnan.expression.Expression;
import com.dat3m.dartagnan.expression.booleans.BoolLiteral;
import com.dat3m.dartagnan.expression.integers.IntLiteral;
import com.dat3m.dartagnan.expression.integers.IntExtract;
import com.dat3m.dartagnan.expression.misc.ITEExpr;
import com.dat3m.dartagnan.expression.type.BooleanType;
import com.dat3m.dartagnan.expression.type.IntegerType;
import com.dat3m.dartagnan.metadata.SourceLocation;
import com.dat3m.dartagnan.program.Register;
import com.dat3m.dartagnan.program.event.Event;
import com.dat3m.dartagnan.program.event.RegReader;
import com.dat3m.dartagnan.program.event.RegWriter;
import com.dat3m.dartagnan.program.event.core.*;
import com.dat3m.dartagnan.program.event.core.threading.*;
import com.dat3m.dartagnan.program.event.core.annotations.StringAnnotation;
import com.dat3m.dartagnan.program.memory.MemoryObject;
import com.dat3m.dartagnan.verification.Task;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.nio.file.Files;
import java.nio.file.Path;
import java.util.*;

/**
 * Read-only serialization of the actual solver Task. Never parses printer text.
 * Both hooks must observe the identical Task and Program in this JVM run.
 */
public final class Snapshot {
    private Snapshot() {}
    private static Task firstTask;
    private static Object firstProgram;
    private static String firstRun;

    private static String type(Expression e) {
        if (e.getType() instanceof IntegerType i) return "bv" + i.getBitWidth();
        if (e.getType() instanceof BooleanType) return "bool";
        return "UNSUPPORTED:" + e.getType().getClass().getName();
    }

    private static Map<String, Object> register(Register r) {
        return Map.of("name", r.getName(), "type", type(r));
    }

    private static Map<String, Object> expression(Expression e) {
        Map<String, Object> result = new LinkedHashMap<>();
        result.put("type", type(e));
        if (e instanceof Register r) {
            result.put("kind", "register");
            result.put("name", r.getName());
        } else if (e instanceof IntLiteral i) {
            result.put("kind", "int");
            result.put("value", i.getValue().toString());
        } else if (e instanceof BoolLiteral b) {
            result.put("kind", "bool");
            result.put("value", b.getValue());
        } else if (e instanceof MemoryObject m) {
            result.put("kind", "object");
            result.put("name", m.getName());
        } else if (e instanceof ITEExpr ite) {
            result.put("kind", "ITE");
            result.put("args", List.of(expression(ite.getCondition()),
                    expression(ite.getTrueCase()), expression(ite.getFalseCase())));
            result.put("register_dependencies", ite.getRegs().stream().map(Snapshot::register)
                    .sorted(Comparator.comparing(x -> (String)x.get("name"))).toList());
        } else {
            result.put("kind", e.getKind() instanceof Enum<?> k
                    ? k.name() : "UNSUPPORTED:" + e.getClass().getName());
            result.put("args", e.getOperands().stream().map(Snapshot::expression).toList());
        }
        result.put("java_class", e.getClass().getName());
        if (e instanceof IntExtract extract) {
            result.put("low_bit", extract.getLowBit());
            result.put("high_bit", extract.getHighBit());
        }
        // All fields of these expression forms are type, opcode, operands,
        // literal/register/object identity, or the explicit extraction bounds.
        result.put("complete", Set.of("Register", "IntLiteral", "BoolLiteral",
                "MemoryObject", "IntBinaryExpr", "IntCmpExpr", "BoolUnaryExpr",
                "BoolBinaryExpr", "IntExtract", "ITEExpr").contains(e.getClass().getSimpleName()));
        return result;
    }

    private static Map<String, Object> event(Event e) {
        Map<String, Object> out = new LinkedHashMap<>();
        out.put("id", e.getGlobalId());
        out.put("class", e.getClass().getSimpleName());
        out.put("java_class", e.getClass().getName());
        out.put("tags", new TreeSet<>(e.getTags()));
        out.put("successor", e.getSuccessor() == null ? null : e.getSuccessor().getGlobalId());
        out.put("cf_implies_exec", e.cfImpliesExec());
        out.put("reads", e instanceof RegReader r
                ? r.getRegisterReads().stream().map(x -> register(x.register()))
                    .distinct().sorted(Comparator.comparing(x -> (String)x.get("name"))).toList()
                : List.of());
        out.put("writes", e instanceof RegWriter w ? register(w.getResultRegister()) : null);
        SourceLocation loc = e.getMetadata(SourceLocation.class);
        if (loc instanceof SourceLocation.Generic g) {
            out.put("source", Map.of("path", g.sourcePath().toString(), "line", g.lineNumber()));
        }
        Event.OriginalId oid = e.getMetadata(Event.OriginalId.class);
        Event.CompilationId cid = e.getMetadata(Event.CompilationId.class);
        out.put("original_id", oid == null ? null : oid.value());
        out.put("compilation_id", cid == null ? null : cid.value());
        if (e instanceof Load l) {
            out.put("addr", expression(l.getAddress()));
            out.put("width", l.getResultRegister().getType() instanceof IntegerType i ? i.getBitWidth() : -1);
        }
        if (e instanceof Store s) {
            out.put("addr", expression(s.getAddress()));
            out.put("value", expression(s.getMemValue()));
            out.put("width", s.getMemValue().getType() instanceof IntegerType i ? i.getBitWidth() : -1);
        }
        if (e instanceof RMWStore r) out.put("rmw_load", r.getLoadEvent().getGlobalId());
        if (e instanceof Local l) out.put("expr", expression(l.getExpr()));
        if (e instanceof CondJump j) {
            out.put("guard", expression(j.getGuard()));
            out.put("jump", j.getLabel().getGlobalId());
        }
        if (e instanceof ThreadCreate c) {
            out.put("spawned_thread", c.getSpawnedThread().getId());
            out.put("arguments", c.getArguments().stream().map(Snapshot::expression).toList());
        }
        if (e instanceof Assume a) out.put("condition", expression(a.getExpr()));
        if (e instanceof Assert a) {
            out.put("condition", expression(a.getExpression()));
            out.put("error_message", a.getErrorMessage());
        }
        if (e instanceof ThreadJoin j) out.put("joined_thread", j.getJoinThread().getId());
        if (e instanceof ThreadStart s) {
            out.put("creator", s.getCreator() == null ? null : s.getCreator().getGlobalId());
        }
        if (e instanceof ThreadArgument a) {
            out.put("creator", a.getCreator().getGlobalId());
            out.put("argument_index", a.getIndex());
        }
        if (e instanceof ThreadReturn r) {
            out.put("return_value", r.getValue().map(Snapshot::expression).orElse(null));
        }
        // Annotation text is descriptive only; its event has no program effect.
        if (e instanceof StringAnnotation s) out.put("annotation", s.defaultString());
        out.put("complete", Set.of("Load", "Store", "RMWStore", "Init", "Local", "Label",
                "CondJump", "Assume", "Assert", "ThreadCreate", "ThreadJoin", "ThreadStart",
                "ThreadArgument", "ThreadReturn", "StringAnnotation").contains(e.getClass().getSimpleName()));
        return out;
    }

    public static synchronized void write(Task task, String phase) {
        String destination = System.getProperty("cert.snapshot.dir");
        if (destination == null) return;
        if (!Set.of("before-encoding", "after-encoding").contains(phase)) {
            throw new IllegalArgumentException("Unknown certification phase");
        }
        if (task.getProgram().getArch() != Arch.TSO) {
            throw new IllegalArgumentException("Certification snapshot requires TSO target");
        }
        try {
            String run = System.getProperty("cert.run.id");
            if (run == null || run.isBlank()) throw new IllegalStateException("Missing run identity");
            if (phase.equals("before-encoding")) {
                if (firstTask != null) throw new IllegalStateException("Repeated before hook");
                firstTask = task;
                firstProgram = task.getProgram();
                firstRun = run;
            } else if (task != firstTask || task.getProgram() != firstProgram || !run.equals(firstRun)) {
                throw new IllegalStateException("Encoding task/program identity changed");
            }
            List<Object> threads = new ArrayList<>();
            for (com.dat3m.dartagnan.program.Thread t : task.getProgram().getThreads()) {
                threads.add(Map.of("id", t.getId(), "name", t.getName(),
                        "events", t.getEvents().stream().map(Snapshot::event).toList()));
            }
            Map<String, Object> snapshot = new LinkedHashMap<>();
            snapshot.put("format", "dat3m-core-snapshot-v1");
            snapshot.put("arch", "TSO");
            snapshot.put("run_id", run);
            snapshot.put("program_identity", System.identityHashCode(task.getProgram()));
            snapshot.put("config", task.getConfig().asPropertiesString());
            snapshot.put("threads", threads);
            List<Object> memory = new ArrayList<>();
            for (MemoryObject m : task.getProgram().getMemory().getObjects()) {
                Map<Integer, Object> initial = new TreeMap<>();
                for (int offset : m.getInitializedFields()) {
                    initial.put(offset, expression(m.getInitialValue(offset)));
                }
                Map<String, Object> object = new LinkedHashMap<>();
                object.put("name", m.getName());
                object.put("size", expression(m.size()));
                object.put("alignment", expression(m.alignment()));
                object.put("initial", initial);
                object.put("thread_local", m.isThreadLocal());
                memory.add(object);
            }
            snapshot.put("memory", memory);
            Path dir = Path.of(destination);
            Files.createDirectories(dir);
            if (Files.exists(dir.resolve(phase + ".json"))) {
                throw new IllegalStateException("Refusing stale snapshot overwrite");
            }
            new ObjectMapper().writerWithDefaultPrettyPrinter()
                    .writeValue(dir.resolve(phase + ".json").toFile(), snapshot);
        } catch (Exception e) {
            // A failed exporter aborts a certification run. No partial certificate.
            throw new IllegalStateException("Cannot serialize actual solver object", e);
        }
    }
}
