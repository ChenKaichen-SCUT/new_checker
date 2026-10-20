; benchmark generated from python API
(set-info :status unknown)
(declare-fun |entry:rcert_1b3ee8f16fc7_0| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x20 (or true)))
(let ((?x16 (ite $x20 u0 |entry:rcert_1b3ee8f16fc7_0|)))
(let ((?x23 (bvadd ?x16 (_ bv1 32))))
(let ((?x21 (bvadd u0 (_ bv1 32))))
(let (($x12 (=> true (= ?x21 ?x23))))
(not $x12)))))))
(check-sat)
