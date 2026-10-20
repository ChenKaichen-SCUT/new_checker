; benchmark generated from python API
(set-info :status unknown)
(declare-fun |entry:rcert_150e328a9c7e_0| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x41 (or true)))
(let ((?x20 (ite $x41 u0 |entry:rcert_150e328a9c7e_0|)))
(let ((?x24 (bvadd ?x20 (_ bv1 32))))
(let ((?x76 (bvadd u0 (_ bv1 32))))
(let (($x63 (=> true (= ?x76 ?x24))))
(not $x63)))))))
(check-sat)
