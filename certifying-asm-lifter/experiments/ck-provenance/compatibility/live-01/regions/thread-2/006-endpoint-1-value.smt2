; benchmark generated from python API
(set-info :status unknown)
(declare-fun |entry:rcert_150e328a9c7e_0| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x43 (or true)))
(let ((?x11 (ite $x43 u0 |entry:rcert_150e328a9c7e_0|)))
(let ((?x23 (bvadd ?x11 (_ bv1 32))))
(let ((?x6 (bvadd u0 (_ bv1 32))))
(let (($x68 (=> true (= ?x6 ?x23))))
(not $x68)))))))
(check-sat)
