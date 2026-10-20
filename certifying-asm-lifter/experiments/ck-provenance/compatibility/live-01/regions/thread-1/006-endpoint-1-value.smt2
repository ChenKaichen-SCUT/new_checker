; benchmark generated from python API
(set-info :status unknown)
(declare-fun |entry:rcert_150e328a9c7e_0| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x13 (or true)))
(let ((?x45 (ite $x13 u0 |entry:rcert_150e328a9c7e_0|)))
(let ((?x46 (bvadd ?x45 (_ bv1 32))))
(let ((?x11 (bvadd u0 (_ bv1 32))))
(let (($x28 (=> true (= ?x11 ?x46))))
(not $x28)))))))
(check-sat)
