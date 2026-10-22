"""Only DSL unit tests; never starts any target tool."""
import copy
import os
import uuid
from contextlib import contextmanager
import unittest
from pathlib import Path
from .dsl import Invalid, Limit, canonical, etype, evaluate, path_products, validate
from .exhaustive import compare, decide_a
from .expectations import expected, reachable, relation
from .features import extract, pattern, select
from .pool import boundaries, op, program
from .symbolic import decide
from .transforms import merge, rename, verify_rule
from .witness import inspect, seal, verify


@contextmanager
def evidence_directory():
    # Preserve every SMT/query artifact; avoid Windows sandbox temporary ACLs.
    root = Path(os.environ.get("SG_TEST_EVIDENCE", "output/semantic-testing-unit"))
    path = root / uuid.uuid4().hex
    path.mkdir(parents=True, exist_ok=False)
    yield path


class CoreTests(unittest.TestCase):
    def setUp(self): self.ps = boundaries()

    def test_total_expressions(self):
        for e, answer in [(["add", 4294967295, 1], 0), (["sub", 0, 1], 4294967295),
                          (["shl", 1, 32], 1), (["shr", 4294967295, 31], 1),
                          (["mul", 2147483648, 2], 0), (["ite", False, 1, 2], 2)]:
            with self.subTest(e=e): etype(e, {}); self.assertEqual(evaluate(e, {}), answer)

    def test_reject_undefined_dead_arm(self):
        with self.assertRaises(Invalid): etype(["ite", True, 0, "undefined"], {})

    def test_reject_partial_definition(self):
        p = self.ps["conditional"]; p["threads"][0].pop(0)
        with self.assertRaises(Invalid): validate(p)

    def test_reject_width_type_and_unknown(self):
        for value in (True, -1, 1 << 32, ["div", 2, 1]):
            p = copy.deepcopy(self.ps["faa"]); p["threads"][0][0]["value"] = value
            with self.subTest(value=value), self.assertRaises(Invalid): validate(p)

    def test_reject_unknown_command(self):
        p = self.ps["faa"]; p["threads"][0][0]["op"] = "loop"
        with self.assertRaises(Invalid): validate(p)

    def test_reject_unknown_fields(self):
        p = self.ps["faa"]; p["trusted_safe"] = True
        with self.assertRaises(Invalid): validate(p)

    def test_reject_duplicate_site_and_object(self):
        p = self.ps["faa"]; p["threads"][1][0]["id"] = "a"
        with self.assertRaises(Invalid): validate(p)
        p = self.ps["sb"]; p["threads"][0][0]["obj"] = "absent"
        with self.assertRaises(Invalid): validate(p)

    def test_paths_full_and_limit(self):
        self.assertEqual(len(path_products(self.ps["diamond"])), 2)
        with self.assertRaises(Limit): path_products(self.ps["diamond"], 1)

    def graph(self):
        p = self.ps["faa"]
        core = {"inputs": {}, "reads": {"a:R": 0, "b:R": 1},
                "rf": {"a:R": "I:x", "b:R": "a:W"}, "co": {"x": ["I:x", "a:W", "b:W"]}}
        return p, seal(p, core)

    def test_witness_accept(self):
        p, c = self.graph(); self.assertEqual(verify(p, c)["observation"], [2, 0, 1])

    def test_reject_tampered_evidence(self):
        p, c = self.graph()
        for field in ("events", "paths", "observation", "relations"):
            bad = copy.deepcopy(c); bad[field] = []
            with self.subTest(field=field), self.assertRaises(Invalid): verify(p, bad)

    def test_reject_extra_inactive_read(self):
        p, c = self.graph(); c["core"]["reads"]["unused:R"] = 0
        with self.assertRaises(Invalid): verify(p, c)

    def test_reject_open7(self):
        p, c = self.graph(); c["core"]["reads"]["a:R"] = 7
        with self.assertRaises(Invalid): verify(p, c)

    def test_reject_lost_update(self):
        p, c = self.graph(); c["core"]["reads"]["b:R"] = 0; c["core"]["rf"]["b:R"] = "I:x"
        with self.assertRaisesRegex(Invalid, "RMW"): inspect(p, c["core"])

    def test_reject_init_last(self):
        p, c = self.graph(); c["core"]["co"]["x"] = ["a:W", "b:W", "I:x"]
        with self.assertRaisesRegex(Invalid, "INIT_FIRST"): inspect(p, c["core"])

    def test_reject_missing_rmw_write(self):
        p, c = self.graph(); c["core"]["co"]["x"].pop()
        with self.assertRaises(Invalid): inspect(p, c["core"])

    def test_reject_bool_read_as_integer(self):
        p, c = self.graph(); c["core"]["reads"]["a:R"] = False
        with self.assertRaises(Invalid): inspect(p, c["core"])

    def test_reject_cross_object_rf(self):
        p = self.ps["sb"]
        core = {"inputs": {}, "reads": {"t0_b:R": 0, "t1_b:R": 0},
                "rf": {"t0_b:R": "I:x", "t1_b:R": "I:y"}, "co": {"x": ["I:x", "t0_a:W"], "y": ["I:y", "t1_a:W"]}}
        with self.assertRaisesRegex(Invalid, "OBJECT_VALUE"): inspect(p, core)

    def test_fence_joint_cycle(self):
        p = self.ps["fenced"]
        core = {"inputs": {}, "reads": {"t0_b:R": 0, "t1_b:R": 0},
                "rf": {"t0_b:R": "I:y", "t1_b:R": "I:x"}, "co": {"x": ["I:x", "t0_a:W"], "y": ["I:y", "t1_a:W"]}}
        with self.assertRaisesRegex(Invalid, "TSO_CYCLE"): inspect(p, core)

    def test_diamond_side_conditions(self):
        p = self.ps["diamond"]; q, claim = merge(p, "d", "joined")
        self.assertEqual(verify_rule(p, q, claim)["status"], "RULE_VERIFIED")
        bad = copy.deepcopy(q); bad["threads"][0][0]["value"][1] = ["not", "b"]
        with self.assertRaises(Invalid): verify_rule(p, bad, claim)
        bad = copy.deepcopy(p); bad["threads"][0][0]["then"].append(op("fence", "extra"))
        with self.assertRaises(Invalid): verify_rule(bad, q, claim)

    def test_alpha_capture(self):
        p = self.ps["diamond"]; q, claim = rename(p, 0, "r", "s")
        with self.assertRaises(Invalid): verify_rule(p, q, claim)

    def test_independent_scope(self):
        p = self.ps["faa"]; p["inputs"] = {"v": "bv32"}
        self.assertEqual(decide_a(p)["status"], "UNKNOWN")
        p = self.ps["sequential"]; p["threads"][0][1]["value"] = "r"
        self.assertEqual(decide_a(p)["status"], "UNKNOWN")

    def test_symbolic_complete_and_both_property_polarities(self):
        with evidence_directory() as d:
            p = self.ps["faa"]; r = decide(p, Path(d) / "faa")
            self.assertEqual(r["status"], "COMPLETE"); self.assertEqual(compare(p, r)["status"], "AGREEMENT")
            ex = expected(p, r); self.assertEqual(ex["safe"]["verdict"], "DSL_EXPECTED_SAFE")
            self.assertEqual(ex["unsafe"]["verdict"], "DSL_EXPECTED_UNSAFE")
            self.assertEqual(reachable(p, r, "a:R", 7)["status"], "UNREACHABLE_OPEN_ASSIGNMENT")
            bad = copy.deepcopy(r); bad["observations"].pop()
            with self.assertRaises(Invalid): expected(p, bad)
            self.assertEqual(compare(p, bad)["status"], "CONTRADICTION")
            bad = copy.deepcopy(r); bad["graphs"].pop(); bad["observations"] = [bad["graphs"][0]["observation"]]
            with self.assertRaisesRegex(Invalid, "COMPLETENESS"): expected(p, bad)
            bad = copy.deepcopy(r); bad["model"] = ["wrong-model", "wrong-fences"]
            with self.assertRaisesRegex(Invalid, "MODEL_BINDING"): expected(p, bad)

    def test_graphs_not_observation_representatives(self):
        p = program([[op("store", "a", "x", value=1)], [op("store", "b", "x", value=1)]], [[], []], objects={"x": 0})
        with evidence_directory() as d:
            r = decide(p, Path(d) / "equalwrite")
            self.assertEqual(len(r["observations"]), 1); self.assertEqual(len(r["graphs"]), 2)
            self.assertEqual(compare(p, r)["status"], "AGREEMENT")

    def test_unknown_is_not_exact(self):
        with evidence_directory() as d:
            p = self.ps["faa"]; r = decide(p, Path(d) / "bounded", max_graphs=1)
            self.assertEqual(r["status"], "UNKNOWN")
            with self.assertRaises(Invalid): expected(p, r)
            with self.assertRaises(Invalid): extract(p, r)

    def test_full_bv_input_not_sampled(self):
        p = program([[op("store", "a", "x", value="n")], []], [[], []], {"n": "bv32"}, {"x": 0})
        with evidence_directory() as d:
            r = decide(p, Path(d) / "bv", max_graphs=3)
            self.assertEqual(r["status"], "UNKNOWN"); self.assertEqual(len(r["graphs"]), 3)

    def test_selection_replay(self):
        records = {"a": {"objective": ["1"], "syntax": ["s"], "heldout_three": [], "heldout_behavior": []},
                   "b": {"objective": ["1", "2"], "syntax": ["t"], "heldout_three": [], "heldout_behavior": []}}
        self.assertEqual(select(records, "semantic", 1, 11)["chosen"], ["b"])

    def test_actual_formula_and_blocker_binding(self):
        from .audit import check_case
        from .run import save
        with evidence_directory() as d:
            case = Path(d) / "case"
            p = self.ps["faa"]; r = decide(p, case)
            self.assertEqual(check_case(case)["explicit"], "AGREEMENT")
            bad = copy.deepcopy(r); bad["graphs"].pop(); bad["observations"] = [bad["graphs"][0]["observation"]]
            # Certificate tampering sensitivity, never a real-tool fault/bug claim.
            save(case / "result.json", bad)
            with self.assertRaisesRegex(Invalid, "GRAPH_SET"): check_case(case)
            save(case / "tampered-result.json", bad); save(case / "result.json", r)
            base = case / "path-000.smt2"; original = base.read_text(encoding="utf-8")
            base.write_text(original.replace("(check-sat)", "(assert false)\n(check-sat)"), encoding="utf-8")
            with self.assertRaisesRegex(Invalid, "FORMULA_BINDING"): check_case(case)
            (case / "tampered-base.smt2").write_text(base.read_text(encoding="utf-8"), encoding="utf-8")
            base.write_text(original, encoding="utf-8")

    def test_atomic_order_SB(self):
        p = self.ps["sb"]
        for t in p["threads"]: t[0].update(op="faa", dst="old")
        with evidence_directory() as d:
            r = decide(p, Path(d) / "atomic")
            self.assertEqual(compare(p, r)["status"], "AGREEMENT")
            self.assertNotIn([1, 1, 0, 0], r["observations"])

    def test_empty_and_timeout(self):
        with evidence_directory() as d:
            p = self.ps["diamond"]; p["domain"] = False
            self.assertEqual(decide(p, Path(d) / "empty")["status"], "EMPTY_INPUT_DOMAIN")
            self.assertEqual(decide(self.ps["faa"], Path(d) / "timeout", seconds=0)["status"], "UNKNOWN")

    def test_all_bv_bits_are_not_inferred_from_constants(self):
        # A full-width deterministic return expression: B is exact in scope,
        # but completeness certification remains explicitly outside A0.
        p = program([[op("set", "set", dst="v", value=["shr", "n", 31])], []], [["v"], []],
                    {"n": "bv32"}, {"x": 0}, ["eq", "n", 2147483648])
        with evidence_directory() as d:
            r = decide(p, Path(d) / "highbit")
            self.assertEqual(r["status"], "COMPLETE")
            self.assertEqual(r["observations"], [[2147483648, 0, 1]])
            with self.assertRaisesRegex(Invalid, "COMPLETENESS"): expected(p, r)


if __name__ == "__main__": unittest.main(verbosity=2)
