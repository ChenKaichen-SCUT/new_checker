"""DSL-only validation of encoding boundaries and acceptance interfaces."""
import copy
import random
import unittest
import z3
from semantic_testing.dsl import Invalid,canonical
from semantic_testing.pool import boundaries
from semantic_testing.exhaustive import decide_a
from semantic_testing.witness import inspect
from .grammar import domain,decode,random_choices,validate_domain
from .check import grammar_membership
from .encode import Synthesis
from .patterns import matches,targets,negatives,target


class Tests(unittest.TestCase):
    def test_domain_boolean_not_integer(self):
        d=domain(); d['slots']=True
        with self.assertRaises(Invalid): validate_domain(d)

    def test_domain_metadata_does_not_mutate_reference(self):
        d=domain(); d['values'][3][2]=77
        with self.assertRaises(Invalid): validate_domain(d)
        self.assertEqual(domain()['values'][3],['ite','b',1,2])
        d=domain(); d['values'][0]=False
        with self.assertRaises(Invalid): validate_domain(d)

    def test_common_grammar_roundtrip(self):
        for threads in (2,3):
            d=domain(threads); rng=random.Random(17)
            for _ in range(30):
                p=decode(d,random_choices(d,rng)); c=grammar_membership(p,d)
                self.assertEqual(canonical(p),canonical(decode(d,c)))

    def test_unknown_host_rejects(self):
        d=domain(); p=decode(d,random_choices(d,random.Random(1)))
        p['threads'][0].append(dict(id='extra',op='set',dst='v0',value=0))
        with self.assertRaises(Invalid): grammar_membership(p,d)

    def test_changed_observation_rejects(self):
        d=domain(); p=decode(d,random_choices(d,random.Random(1))); p['observe']['locals'][0]=[]
        with self.assertRaises(Invalid): grammar_membership(p,d)

    def test_data_dependent_operand_rejects(self):
        d=domain(); c=random_choices(d,random.Random(1)); c[0]=dict(mode=0,arms=[dict(kind=3,obj=0,value=1)]*2)
        p=decode(d,c); p['threads'][0][1]['value']='v0'
        with self.assertRaises(Invalid): grammar_membership(p,d)

    def test_unknown_pattern_relation_rejects(self):
        p=copy.deepcopy(targets()[0]); p['edges'][0][0]='unknown'
        with self.assertRaises(Invalid): Synthesis(domain(),[dict(pattern=p)])

    def test_false_is_not_unspecified(self):
        import json
        p=boundaries()['faa']; a=decide_a(p); gs=[inspect(p,json.loads(c)) for c in a['graphs']]
        positive=targets()[4]
        negative=copy.deepcopy(positive); negative['edges'].append(['co',0,1,False])
        self.assertTrue(any(matches(g,positive) is not None for g in gs))
        self.assertTrue(all(matches(g,negative) is None for g in gs))

    def test_two_thread_scope_excludes_three_threads(self):
        enc=Synthesis(domain(2,1),[dict(pattern=targets()[5])]); enc.solver.set(timeout=10000)
        self.assertEqual(enc.solver.check(),z3.unsat)

    def test_separate_execution_inputs(self):
        p=targets()[3]; e=Synthesis(domain(2,1),[dict(pattern=p,input=False),dict(pattern=p,input=True)])
        e.solver.set(timeout=10000); self.assertEqual(e.solver.check(),z3.sat)

    def test_arms_cannot_both_execute(self):
        p=target('two_reads',[dict(kind='R'),dict(kind='R')],[('po',0,1)])
        e=Synthesis(domain(2,1),[dict(pattern=p)]); e.solver.set(timeout=10000)
        self.assertEqual(e.solver.check(),z3.unsat)

    def test_no_new_input_domain(self):
        d=domain(); p=decode(d,random_choices(d,random.Random(1))); p['domain']='b'
        with self.assertRaises(Invalid): grammar_membership(p,d)

    def test_complete_input_and_observation(self):
        d=domain(2,1,1); c=[dict(mode=0,arms=[dict(kind=3,obj=0,value=3)]*2) for _ in range(2)]
        p=decode(d,c); a=decide_a(p)
        import json
        obs=[json.loads(x) for x in a['observations']]
        self.assertEqual(a['status'],'COMPLETE')
        self.assertEqual({x[0] for x in obs},{True,False})
        self.assertEqual({x[1] for x in obs},{2,4})


if __name__ == '__main__': unittest.main()
