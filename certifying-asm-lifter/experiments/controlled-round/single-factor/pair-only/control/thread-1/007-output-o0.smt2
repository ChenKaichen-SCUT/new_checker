; benchmark generated from python API
(set-info :status unknown)
(declare-fun |entry:rcert_150e328a9c7e_0| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x12 (or true)))
(let ((?x7 (ite $x12 u0 |entry:rcert_150e328a9c7e_0|)))
(let (($x20 (or $x12)))
(let ((?x72 (ite $x20 ?x7 |entry:rcert_150e328a9c7e_0|)))
(let (($x56 (= u0 ?x72)))
(not $x56)))))))
(check-sat)
