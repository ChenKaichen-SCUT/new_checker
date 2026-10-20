; benchmark generated from python API
(set-info :status unknown)
(declare-fun |entry:rcert_150e328a9c7e_0| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x25 (or true)))
(let ((?x14 (ite $x25 u0 |entry:rcert_150e328a9c7e_0|)))
(let ((?x16 (bvadd ?x14 (_ bv1 32))))
(let ((?x37 (bvadd u0 (_ bv1 32))))
(let (($x28 (=> true (= ?x37 ?x16))))
(not $x28)))))))
(check-sat)
