; benchmark generated from python API
(set-info :status unknown)
(declare-fun |entry:rcert_1b3ee8f16fc7_0| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x47 (or true)))
(let ((?x44 (ite $x47 u0 |entry:rcert_1b3ee8f16fc7_0|)))
(let (($x31 (or $x47)))
(let ((?x68 (ite $x31 ?x44 |entry:rcert_1b3ee8f16fc7_0|)))
(let (($x78 (= u0 ?x68)))
(not $x78)))))))
(check-sat)
