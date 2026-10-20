; benchmark generated from python API
(set-info :status unknown)
(declare-fun |entry:rcert_1b3ee8f16fc7_0| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x30 (or true)))
(let ((?x10 (ite $x30 u0 |entry:rcert_1b3ee8f16fc7_0|)))
(let ((?x32 (bvadd ?x10 (_ bv1 32))))
(let ((?x15 (bvadd u0 (_ bv1 32))))
(let (($x23 (=> true (= ?x15 ?x32))))
(not $x23)))))))
(check-sat)
