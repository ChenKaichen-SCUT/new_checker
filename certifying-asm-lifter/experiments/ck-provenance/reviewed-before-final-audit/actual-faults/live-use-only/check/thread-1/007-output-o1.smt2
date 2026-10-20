; benchmark generated from python API
(set-info :status unknown)
(declare-fun |entry:rcert_1b3ee8f16fc7_0| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x47 (or true)))
(let ((?x8 (ite $x47 u0 |entry:rcert_1b3ee8f16fc7_0|)))
(let (($x31 (or $x47)))
(let ((?x68 (ite $x31 ?x8 |entry:rcert_1b3ee8f16fc7_0|)))
(let (($x75 (= u0 ?x68)))
(not $x75)))))))
(check-sat)
