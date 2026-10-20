; benchmark generated from python API
(set-info :status unknown)
(declare-fun |entry:rcert_1b3ee8f16fc7_0| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x44 (or true)))
(let ((?x16 (ite $x44 u0 |entry:rcert_1b3ee8f16fc7_0|)))
(let ((?x27 (bvadd ?x16 (_ bv1 32))))
(let ((?x37 (bvadd u0 (_ bv1 32))))
(let (($x50 (=> true (= ?x37 ?x27))))
(not $x50)))))))
(check-sat)
