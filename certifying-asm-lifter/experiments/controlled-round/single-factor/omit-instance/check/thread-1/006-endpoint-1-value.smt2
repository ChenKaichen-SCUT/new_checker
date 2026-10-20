; benchmark generated from python API
(set-info :status unknown)
(declare-fun |entry:rcert_d0c1dc0e6121_0| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x45 (or true)))
(let ((?x42 (ite $x45 u0 |entry:rcert_d0c1dc0e6121_0|)))
(let ((?x31 (bvadd ?x42 (_ bv1 32))))
(let ((?x62 (bvadd u0 (_ bv1 32))))
(let (($x74 (=> true (= ?x62 ?x31))))
(not $x74)))))))
(check-sat)
