; benchmark generated from python API
(set-info :status unknown)
(declare-fun |entry:rcert_1b3ee8f16fc7_0| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x27 (or true)))
(let ((?x18 (ite $x27 u0 |entry:rcert_1b3ee8f16fc7_0|)))
(let ((?x71 (bvadd ?x18 (_ bv1 32))))
(let ((?x29 (bvadd u0 (_ bv1 32))))
(let (($x5 (=> true (= ?x29 ?x71))))
(not $x5)))))))
(check-sat)
