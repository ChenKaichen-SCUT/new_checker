; benchmark generated from python API
(set-info :status unknown)
(declare-fun |entry:rcert_1b3ee8f16fc7_0| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x13 (or true)))
(let ((?x39 (ite $x13 u0 |entry:rcert_1b3ee8f16fc7_0|)))
(let (($x61 (or $x13)))
(let ((?x10 (ite $x61 ?x39 |entry:rcert_1b3ee8f16fc7_0|)))
(let (($x44 (= u0 ?x10)))
(not $x44)))))))
(check-sat)
