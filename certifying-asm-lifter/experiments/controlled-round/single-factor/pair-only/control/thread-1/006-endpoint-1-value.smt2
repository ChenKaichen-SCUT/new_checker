; benchmark generated from python API
(set-info :status unknown)
(declare-fun |entry:rcert_150e328a9c7e_0| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x12 (or true)))
(let ((?x7 (ite $x12 u0 |entry:rcert_150e328a9c7e_0|)))
(let ((?x14 (bvadd ?x7 (_ bv1 32))))
(let ((?x19 (bvadd u0 (_ bv1 32))))
(let (($x43 (=> true (= ?x19 ?x14))))
(not $x43)))))))
(check-sat)
