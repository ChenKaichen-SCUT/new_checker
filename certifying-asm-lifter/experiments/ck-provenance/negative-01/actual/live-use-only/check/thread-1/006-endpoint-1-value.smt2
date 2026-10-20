; benchmark generated from python API
(set-info :status unknown)
(declare-fun |entry:rcert_1b3ee8f16fc7_0| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x16 (or true)))
(let ((?x19 (ite $x16 u0 |entry:rcert_1b3ee8f16fc7_0|)))
(let ((?x13 (bvadd ?x19 (_ bv1 32))))
(let ((?x42 (bvadd u0 (_ bv1 32))))
(let (($x56 (=> true (= ?x42 ?x13))))
(not $x56)))))))
(check-sat)
