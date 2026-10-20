; benchmark generated from python API
(set-info :status unknown)
(declare-fun |entry:rcert_d0c1dc0e6121_0| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x31 (or true)))
(let ((?x30 (ite $x31 u0 |entry:rcert_d0c1dc0e6121_0|)))
(let ((?x76 (bvadd ?x30 (_ bv1 32))))
(let ((?x57 (bvadd u0 (_ bv1 32))))
(let (($x62 (=> true (= ?x57 ?x76))))
(not $x62)))))))
(check-sat)
