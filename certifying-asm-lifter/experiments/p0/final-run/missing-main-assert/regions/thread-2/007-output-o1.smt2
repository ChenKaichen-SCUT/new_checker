; benchmark generated from python API
(set-info :status unknown)
(declare-fun |entry:rcert_9d5ba0d7aeed_0| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x19 (or true)))
(let ((?x11 (ite $x19 u0 |entry:rcert_9d5ba0d7aeed_0|)))
(let (($x13 (or $x19)))
(let ((?x78 (ite $x13 ?x11 |entry:rcert_9d5ba0d7aeed_0|)))
(let (($x67 (= u0 ?x78)))
(not $x67)))))))
(check-sat)
