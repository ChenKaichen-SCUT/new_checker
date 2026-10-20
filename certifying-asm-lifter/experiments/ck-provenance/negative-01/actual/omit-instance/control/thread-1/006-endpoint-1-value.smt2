; benchmark generated from python API
(set-info :status unknown)
(declare-fun |entry:rcert_1b3ee8f16fc7_0| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x18 (or true)))
(let ((?x13 (ite $x18 u0 |entry:rcert_1b3ee8f16fc7_0|)))
(let ((?x74 (bvadd ?x13 (_ bv1 32))))
(let ((?x44 (bvadd u0 (_ bv1 32))))
(let (($x46 (=> true (= ?x44 ?x74))))
(not $x46)))))))
(check-sat)
