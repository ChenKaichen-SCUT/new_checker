; benchmark generated from python API
(set-info :status unknown)
(declare-fun |entry:rcert_1b3ee8f16fc7_0| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x27 (or true)))
(let ((?x18 (ite $x27 u0 |entry:rcert_1b3ee8f16fc7_0|)))
(let (($x28 (or $x27)))
(let ((?x72 (ite $x28 ?x18 |entry:rcert_1b3ee8f16fc7_0|)))
(let (($x66 (= u0 ?x72)))
(not $x66)))))))
(check-sat)
