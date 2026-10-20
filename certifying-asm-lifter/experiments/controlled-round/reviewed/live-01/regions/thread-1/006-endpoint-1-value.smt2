; benchmark generated from python API
(set-info :status unknown)
(declare-fun |entry:rcert_150e328a9c7e_0| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x12 (or true)))
(let ((?x32 (ite $x12 u0 |entry:rcert_150e328a9c7e_0|)))
(let ((?x31 (bvadd ?x32 (_ bv1 32))))
(let ((?x20 (bvadd u0 (_ bv1 32))))
(let (($x30 (=> true (= ?x20 ?x31))))
(not $x30)))))))
(check-sat)
