; benchmark generated from python API
(set-info :status unknown)
(declare-fun |entry:rcert_1b3ee8f16fc7_0| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x64 (or true)))
(let ((?x72 (ite $x64 u0 |entry:rcert_1b3ee8f16fc7_0|)))
(let (($x31 (or $x64)))
(let ((?x12 (ite $x31 ?x72 |entry:rcert_1b3ee8f16fc7_0|)))
(let (($x29 (= u0 ?x12)))
(not $x29)))))))
(check-sat)
