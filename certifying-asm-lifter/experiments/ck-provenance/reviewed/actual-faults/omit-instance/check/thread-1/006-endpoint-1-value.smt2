; benchmark generated from python API
(set-info :status unknown)
(declare-fun |entry:rcert_1b3ee8f16fc7_0| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x16 (or true)))
(let ((?x69 (ite $x16 u0 |entry:rcert_1b3ee8f16fc7_0|)))
(let ((?x59 (bvadd ?x69 (_ bv1 32))))
(let ((?x7 (bvadd u0 (_ bv1 32))))
(let (($x14 (=> true (= ?x7 ?x59))))
(not $x14)))))))
(check-sat)
