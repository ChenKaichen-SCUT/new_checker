; benchmark generated from python API
(set-info :status unknown)
(declare-fun |entry:rcert_1b3ee8f16fc7_0| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x19 (or true)))
(let ((?x15 (ite $x19 u0 |entry:rcert_1b3ee8f16fc7_0|)))
(let ((?x5 (bvadd ?x15 (_ bv1 32))))
(let ((?x24 (bvadd u0 (_ bv1 32))))
(let (($x68 (=> true (= ?x24 ?x5))))
(not $x68)))))))
(check-sat)
