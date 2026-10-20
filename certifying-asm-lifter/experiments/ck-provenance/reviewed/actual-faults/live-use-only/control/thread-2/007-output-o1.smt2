; benchmark generated from python API
(set-info :status unknown)
(declare-fun |entry:rcert_1b3ee8f16fc7_0| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x35 (or true)))
(let ((?x8 (ite $x35 u0 |entry:rcert_1b3ee8f16fc7_0|)))
(let (($x36 (or $x35)))
(let ((?x73 (ite $x36 ?x8 |entry:rcert_1b3ee8f16fc7_0|)))
(let (($x14 (= u0 ?x73)))
(not $x14)))))))
(check-sat)
