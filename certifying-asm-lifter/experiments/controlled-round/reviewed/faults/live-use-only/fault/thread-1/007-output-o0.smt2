; benchmark generated from python API
(set-info :status unknown)
(declare-fun |entry:rcert_150e328a9c7e_0| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x25 (or true)))
(let ((?x14 (ite $x25 u0 |entry:rcert_150e328a9c7e_0|)))
(let (($x42 (or $x25)))
(let ((?x11 (ite $x42 ?x14 |entry:rcert_150e328a9c7e_0|)))
(let (($x65 (= u0 ?x11)))
(not $x65)))))))
(check-sat)
