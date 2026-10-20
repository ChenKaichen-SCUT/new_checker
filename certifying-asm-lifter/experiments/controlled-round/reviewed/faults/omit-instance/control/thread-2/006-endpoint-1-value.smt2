; benchmark generated from python API
(set-info :status unknown)
(declare-fun |entry:rcert_d0c1dc0e6121_0| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x34 (or true)))
(let ((?x50 (ite $x34 u0 |entry:rcert_d0c1dc0e6121_0|)))
(let ((?x62 (bvadd ?x50 (_ bv1 32))))
(let ((?x37 (bvadd u0 (_ bv1 32))))
(let (($x66 (=> true (= ?x37 ?x62))))
(not $x66)))))))
(check-sat)
