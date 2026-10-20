; benchmark generated from python API
(set-info :status unknown)
(declare-fun |entry:rcert_d0c1dc0e6121_0| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x12 (or true)))
(let ((?x21 (ite $x12 u0 |entry:rcert_d0c1dc0e6121_0|)))
(let ((?x31 (bvadd ?x21 (_ bv1 32))))
(let ((?x34 (bvadd u0 (_ bv1 32))))
(let (($x46 (=> true (= ?x34 ?x31))))
(not $x46)))))))
(check-sat)
