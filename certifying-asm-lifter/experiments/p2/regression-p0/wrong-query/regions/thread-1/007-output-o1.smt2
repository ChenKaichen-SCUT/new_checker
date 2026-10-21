; benchmark generated from python API
(set-info :status unknown)
(declare-fun |entry:rcert_9d5ba0d7aeed_0| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x30 (or true)))
(let ((?x16 (ite $x30 u0 |entry:rcert_9d5ba0d7aeed_0|)))
(let (($x40 (or $x30)))
(let ((?x38 (ite $x40 ?x16 |entry:rcert_9d5ba0d7aeed_0|)))
(let (($x42 (= u0 ?x38)))
(not $x42)))))))
(check-sat)
