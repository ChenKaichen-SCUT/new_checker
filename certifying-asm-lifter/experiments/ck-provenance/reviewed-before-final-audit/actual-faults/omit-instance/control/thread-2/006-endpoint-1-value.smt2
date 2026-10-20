; benchmark generated from python API
(set-info :status unknown)
(declare-fun |entry:rcert_1b3ee8f16fc7_0| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x15 (or true)))
(let ((?x69 (ite $x15 u0 |entry:rcert_1b3ee8f16fc7_0|)))
(let ((?x22 (bvadd ?x69 (_ bv1 32))))
(let ((?x5 (bvadd u0 (_ bv1 32))))
(let (($x19 (=> true (= ?x5 ?x22))))
(not $x19)))))))
(check-sat)
