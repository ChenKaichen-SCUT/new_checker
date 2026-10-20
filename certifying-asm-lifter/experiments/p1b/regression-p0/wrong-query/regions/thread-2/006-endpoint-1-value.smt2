; benchmark generated from python API
(set-info :status unknown)
(declare-fun |entry:rcert_9d5ba0d7aeed_0| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x19 (or true)))
(let ((?x7 (ite $x19 u0 |entry:rcert_9d5ba0d7aeed_0|)))
(let ((?x34 (bvadd ?x7 (_ bv1 32))))
(let ((?x24 (bvadd u0 (_ bv1 32))))
(let (($x68 (=> true (= ?x24 ?x34))))
(not $x68)))))))
(check-sat)
