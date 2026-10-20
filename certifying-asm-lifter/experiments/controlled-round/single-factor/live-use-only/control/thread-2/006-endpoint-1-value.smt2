; benchmark generated from python API
(set-info :status unknown)
(declare-fun |entry:rcert_150e328a9c7e_0| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x11 (or true)))
(let ((?x31 (ite $x11 u0 |entry:rcert_150e328a9c7e_0|)))
(let ((?x10 (bvadd ?x31 (_ bv1 32))))
(let ((?x9 (bvadd u0 (_ bv1 32))))
(let (($x43 (=> true (= ?x9 ?x10))))
(not $x43)))))))
(check-sat)
