; benchmark generated from python API
(set-info :status unknown)
(declare-fun |entry:rcert_1b3ee8f16fc7_0| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x20 (or true)))
(let ((?x16 (ite $x20 u0 |entry:rcert_1b3ee8f16fc7_0|)))
(let (($x40 (or $x20)))
(let ((?x42 (ite $x40 ?x16 |entry:rcert_1b3ee8f16fc7_0|)))
(let (($x10 (= u0 ?x42)))
(not $x10)))))))
(check-sat)
