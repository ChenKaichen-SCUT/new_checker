; benchmark generated from python API
(set-info :status unknown)
(declare-fun |entry:rcert_1b3ee8f16fc7_0| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x19 (or true)))
(let ((?x15 (ite $x19 u0 |entry:rcert_1b3ee8f16fc7_0|)))
(let (($x37 (or $x19)))
(let ((?x73 (ite $x37 ?x15 |entry:rcert_1b3ee8f16fc7_0|)))
(let (($x67 (= u0 ?x73)))
(not $x67)))))))
(check-sat)
