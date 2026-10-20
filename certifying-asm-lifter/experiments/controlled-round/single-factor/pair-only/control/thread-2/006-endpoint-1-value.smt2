; benchmark generated from python API
(set-info :status unknown)
(declare-fun |entry:rcert_150e328a9c7e_0| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x18 (or true)))
(let ((?x30 (ite $x18 u0 |entry:rcert_150e328a9c7e_0|)))
(let ((?x47 (bvadd ?x30 (_ bv1 32))))
(let ((?x53 (bvadd u0 (_ bv1 32))))
(let (($x70 (=> true (= ?x53 ?x47))))
(not $x70)))))))
(check-sat)
