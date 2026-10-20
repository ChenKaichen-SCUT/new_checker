; benchmark generated from python API
(set-info :status unknown)
(declare-fun |entry:rcert_150e328a9c7e_0| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x13 (or true)))
(let ((?x45 (ite $x13 u0 |entry:rcert_150e328a9c7e_0|)))
(let (($x34 (or $x13)))
(let ((?x21 (ite $x34 ?x45 |entry:rcert_150e328a9c7e_0|)))
(let (($x12 (= u0 ?x21)))
(not $x12)))))))
(check-sat)
