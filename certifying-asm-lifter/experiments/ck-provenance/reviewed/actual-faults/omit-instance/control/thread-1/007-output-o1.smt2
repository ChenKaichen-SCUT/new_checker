; benchmark generated from python API
(set-info :status unknown)
(declare-fun |entry:rcert_1b3ee8f16fc7_0| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x8 (or true)))
(let ((?x16 (ite $x8 u0 |entry:rcert_1b3ee8f16fc7_0|)))
(let (($x73 (or $x8)))
(let ((?x7 (ite $x73 ?x16 |entry:rcert_1b3ee8f16fc7_0|)))
(let (($x47 (= u0 ?x7)))
(not $x47)))))))
(check-sat)
