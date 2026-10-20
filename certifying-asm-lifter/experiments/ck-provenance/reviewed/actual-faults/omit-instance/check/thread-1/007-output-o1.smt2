; benchmark generated from python API
(set-info :status unknown)
(declare-fun |entry:rcert_1b3ee8f16fc7_0| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x16 (or true)))
(let ((?x69 (ite $x16 u0 |entry:rcert_1b3ee8f16fc7_0|)))
(let (($x27 (or $x16)))
(let ((?x17 (ite $x27 ?x69 |entry:rcert_1b3ee8f16fc7_0|)))
(let (($x37 (= u0 ?x17)))
(not $x37)))))))
(check-sat)
