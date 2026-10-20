; benchmark generated from python API
(set-info :status unknown)
(declare-fun |entry:rcert_1b3ee8f16fc7_0| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x6 (or true)))
(let ((?x47 (ite $x6 u0 |entry:rcert_1b3ee8f16fc7_0|)))
(let (($x57 (or $x6)))
(let ((?x24 (ite $x57 ?x47 |entry:rcert_1b3ee8f16fc7_0|)))
(let (($x32 (= u0 ?x24)))
(not $x32)))))))
(check-sat)
