package com.dat3m.dartagnan.verification.solving;

import com.dat3m.dartagnan.configuration.Property;
import com.dat3m.dartagnan.encoding.*;
import com.dat3m.dartagnan.smt.ProverWithTracker;
import com.dat3m.dartagnan.verification.ResultStatus;
import com.dat3m.dartagnan.verification.Context;
import com.dat3m.dartagnan.verification.Task;
import com.dat3m.dartagnan.verification.VerificationTask;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.sosy_lab.common.configuration.Configuration;
import org.sosy_lab.common.configuration.InvalidConfigurationException;
import org.sosy_lab.java_smt.api.BooleanFormula;
import org.sosy_lab.java_smt.api.BooleanFormulaManager;
import org.sosy_lab.java_smt.api.SolverContext;
import org.sosy_lab.java_smt.api.SolverException;

import static com.dat3m.dartagnan.verification.ResultStatus.FAIL;
import static com.dat3m.dartagnan.verification.ResultStatus.PASS;
import static java.util.Collections.singletonList;

public class AssumeSolver extends ModelChecker {

    private static final Logger logger = LoggerFactory.getLogger(AssumeSolver.class);

    private AssumeSolver(VerificationTask task) throws InvalidConfigurationException {
        super(task);
    }

    public static AssumeSolver create(VerificationTask task) throws InvalidConfigurationException {
        return new AssumeSolver(task);
    }

    protected Context preprocessAndAnalyse(Task task) throws InvalidConfigurationException {
        final Configuration config = task.getConfig();
        preprocessProgram(task, config);
        certifying.P1Faults.apply(task);
        preprocessMemoryModel(task);

        final Context analysisContext = Context.create();
        performStaticProgramAnalyses(task, analysisContext, config);
        performStaticWmmAnalyses(task, analysisContext, config);
        performIntervalAnalysis(task, analysisContext, config);
        return analysisContext;
    }

    @Override
    protected void runInternal() throws InterruptedException, SolverException, InvalidConfigurationException {
        final VerificationTask task = (VerificationTask) this.task;
        final Context analysisContext = preprocessAndAnalyse(task);

        initSMTSolver(task.getConfig());
        final SolverContext solverContext = this.solverContext;
        final ProverWithTracker prover = this.prover;

        certifying.Snapshot.write(task, "before-encoding");
        context = EncodingContext.of(task, analysisContext, solverContext.getFormulaManager());
        certifying.P0Audit.begin(task, context, solverContext.getFormulaManager());
        ProgramEncoder programEncoder = ProgramEncoder.withContext(context);
        WmmEncoder wmmEncoder = WmmEncoder.withContext(context);
        PropertyEncoder propertyEncoder = PropertyEncoder.withContext(context, wmmEncoder);
        SymmetryEncoder symmetryEncoder = SymmetryEncoder.withContext(context);

        logger.info("Starting encoding using {}", solverContext.getVersion());
        prover.writeComment("Program encoding");
        prover.addConstraint(certifying.P0Audit.component("program", programEncoder.encodeFullProgram()));
        prover.writeComment("Memory model encoding");
        prover.addConstraint(certifying.P0Audit.component("memory_model", wmmEncoder.encodeFullMemoryModel()));
        prover.writeComment("Symmetry breaking encoding");
        prover.addConstraint(certifying.P0Audit.component("symmetry", symmetryEncoder.encodeFullSymmetryBreaking()));

        BooleanFormulaManager bmgr = context.getBooleanFormulaManager();
        // Adding bounds
        prover.writeComment("Bounds over variables");
        prover.addConstraint(certifying.P0Audit.component("variable_bounds", programEncoder.encodeBounds()));
        BooleanFormula assumptionLiteral = bmgr.makeVariable("DAT3M_spec_assumption");
        BooleanFormula propertyEncoding = propertyEncoder.encodeProperties(task.getProperties());
        BooleanFormula assumedSpec = bmgr.implication(assumptionLiteral, propertyEncoding);
        prover.writeComment("Property encoding");
        certifying.P0Audit.component("assumption_literal", assumptionLiteral);
        certifying.P0Audit.component("property", propertyEncoding);
        prover.addConstraint(certifying.P0Audit.component("assumed_property", assumedSpec));
        certifying.Snapshot.write(task, "after-encoding");

        checkForInterrupts();

        logger.info("Starting first solver.check()");
        var certAssumptions = singletonList(certifying.P1Faults.assumption(assumptionLiteral, bmgr));
        certifying.P0Audit.start("safety", certAssumptions);
        boolean certSafetyUnsat = prover.isUnsatWithAssumptions(certAssumptions);
        certifying.P0Audit.finish(certSafetyUnsat, prover);
        if (certSafetyUnsat) {
            checkForInterrupts();
            prover.writeComment("Bound encoding");
            prover.addConstraint(certifying.P0Audit.component("bound", propertyEncoder.encodeBoundEventExec()));
            logger.info("Starting second solver.check()");
            certifying.P0Audit.start("bound", java.util.List.of());
            boolean certBoundUnsat = prover.isUnsat();
            certifying.P0Audit.finish(certBoundUnsat, prover);
            res = certBoundUnsat ? PASS : ResultStatus.UNKNOWN;
        } else {
            res = FAIL;
        }

        if (logger.isDebugEnabled()) {
            logProverStatistics(logger, prover);
        }

        // For Safety specs, we have SAT=FAIL, but for reachability specs, we have SAT=PASS
        res = Property.getCombinedType(task.getProperties(), task) == Property.Type.SAFETY ? res : res.invert();
        certifying.P0Audit.complete(res.name());
        logger.info("Verification finished with result {}", res);
    }
}
