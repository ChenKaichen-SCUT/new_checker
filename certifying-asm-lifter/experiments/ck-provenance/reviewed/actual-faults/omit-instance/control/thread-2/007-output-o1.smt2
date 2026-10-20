; benchmark generated from python API
(set-info :status unknown)
(declare-fun |entry:rcert_1b3ee8f16fc7_0| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x15 (or true)))
(let ((?x56 (ite $x15 u0 |entry:rcert_1b3ee8f16fc7_0|)))
(let (($x58 (or $x15)))
(let ((?x21 (ite $x58 ?x56 |entry:rcert_1b3ee8f16fc7_0|)))
(let (($x45 (= u0 ?x21)))
(not $x45)))))))
(check-sat)
