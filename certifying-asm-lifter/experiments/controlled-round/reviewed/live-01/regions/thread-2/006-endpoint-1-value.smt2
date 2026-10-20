; benchmark generated from python API
(set-info :status unknown)
(declare-fun |entry:rcert_150e328a9c7e_0| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x9 (or true)))
(let ((?x21 (ite $x9 u0 |entry:rcert_150e328a9c7e_0|)))
(let ((?x71 (bvadd ?x21 (_ bv1 32))))
(let ((?x6 (bvadd u0 (_ bv1 32))))
(let (($x10 (=> true (= ?x6 ?x71))))
(not $x10)))))))
(check-sat)
