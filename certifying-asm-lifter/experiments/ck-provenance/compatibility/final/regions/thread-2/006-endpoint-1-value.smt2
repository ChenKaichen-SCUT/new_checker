; benchmark generated from python API
(set-info :status unknown)
(declare-fun |entry:rcert_d0c1dc0e6121_0| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x45 (or true)))
(let ((?x44 (ite $x45 u0 |entry:rcert_d0c1dc0e6121_0|)))
(let ((?x7 (bvadd ?x44 (_ bv1 32))))
(let ((?x37 (bvadd u0 (_ bv1 32))))
(let (($x27 (=> true (= ?x37 ?x7))))
(not $x27)))))))
(check-sat)
