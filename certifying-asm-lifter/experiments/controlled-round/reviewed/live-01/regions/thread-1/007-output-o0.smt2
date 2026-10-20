; benchmark generated from python API
(set-info :status unknown)
(declare-fun |entry:rcert_150e328a9c7e_0| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x12 (or true)))
(let ((?x32 (ite $x12 u0 |entry:rcert_150e328a9c7e_0|)))
(let (($x17 (or $x12)))
(let ((?x27 (ite $x17 ?x32 |entry:rcert_150e328a9c7e_0|)))
(let (($x26 (= u0 ?x27)))
(not $x26)))))))
(check-sat)
