; benchmark generated from python API
(set-info :status unknown)
(declare-fun |entry:rcert_1b3ee8f16fc7_0| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x18 (or true)))
(let ((?x13 (ite $x18 u0 |entry:rcert_1b3ee8f16fc7_0|)))
(let (($x75 (or $x18)))
(let ((?x65 (ite $x75 ?x13 |entry:rcert_1b3ee8f16fc7_0|)))
(let (($x16 (= u0 ?x65)))
(not $x16)))))))
(check-sat)
