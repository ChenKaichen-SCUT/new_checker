; benchmark generated from python API
(set-info :status unknown)
(declare-fun |entry:rcert_1b3ee8f16fc7_0| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x44 (or true)))
(let ((?x16 (ite $x44 u0 |entry:rcert_1b3ee8f16fc7_0|)))
(let (($x21 (or $x44)))
(let ((?x77 (ite $x21 ?x16 |entry:rcert_1b3ee8f16fc7_0|)))
(let (($x47 (= u0 ?x77)))
(not $x47)))))))
(check-sat)
