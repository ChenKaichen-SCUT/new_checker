; benchmark generated from python API
(set-info :status unknown)
(declare-fun |entry:rcert_1b3ee8f16fc7_0| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x19 (or true)))
(let ((?x18 (ite $x19 u0 |entry:rcert_1b3ee8f16fc7_0|)))
(let (($x23 (or $x19)))
(let ((?x75 (ite $x23 ?x18 |entry:rcert_1b3ee8f16fc7_0|)))
(let (($x67 (= u0 ?x75)))
(not $x67)))))))
(check-sat)
