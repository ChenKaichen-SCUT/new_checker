; benchmark generated from python API
(set-info :status unknown)
(declare-fun |entry:rcert_1b3ee8f16fc7_0| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x47 (or true)))
(let ((?x8 (ite $x47 u0 |entry:rcert_1b3ee8f16fc7_0|)))
(let ((?x56 (bvadd ?x8 (_ bv1 32))))
(let ((?x24 (bvadd u0 (_ bv1 32))))
(let (($x12 (=> true (= ?x24 ?x56))))
(not $x12)))))))
(check-sat)
