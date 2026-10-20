; benchmark generated from python API
(set-info :status unknown)
(declare-fun |entry:rcert_150e328a9c7e_0| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x43 (or true)))
(let ((?x44 (ite $x43 u0 |entry:rcert_150e328a9c7e_0|)))
(let ((?x5 (bvadd ?x44 (_ bv1 32))))
(let ((?x39 (bvadd u0 (_ bv1 32))))
(let (($x68 (=> true (= ?x39 ?x5))))
(not $x68)))))))
(check-sat)
