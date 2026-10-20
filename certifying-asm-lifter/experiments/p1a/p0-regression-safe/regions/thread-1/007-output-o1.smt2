; benchmark generated from python API
(set-info :status unknown)
(declare-fun |entry:rcert_1b3ee8f16fc7_0| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x30 (or true)))
(let ((?x10 (ite $x30 u0 |entry:rcert_1b3ee8f16fc7_0|)))
(let (($x7 (or $x30)))
(let ((?x39 (ite $x7 ?x10 |entry:rcert_1b3ee8f16fc7_0|)))
(let (($x42 (= u0 ?x39)))
(not $x42)))))))
(check-sat)
