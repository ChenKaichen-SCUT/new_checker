; benchmark generated from python API
(set-info :status unknown)
(declare-fun |entry:rcert_9d5ba0d7aeed_0| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x30 (or true)))
(let ((?x17 (ite $x30 u0 |entry:rcert_9d5ba0d7aeed_0|)))
(let (($x11 (or $x30)))
(let ((?x43 (ite $x11 ?x17 |entry:rcert_9d5ba0d7aeed_0|)))
(let (($x42 (= u0 ?x43)))
(not $x42)))))))
(check-sat)
