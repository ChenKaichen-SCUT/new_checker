; benchmark generated from python API
(set-info :status unknown)
(declare-fun |entry:rcert_1b3ee8f16fc7_0| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x16 (or true)))
(let ((?x19 (ite $x16 u0 |entry:rcert_1b3ee8f16fc7_0|)))
(let (($x31 (or $x16)))
(let ((?x45 (ite $x31 ?x19 |entry:rcert_1b3ee8f16fc7_0|)))
(let (($x21 (= u0 ?x45)))
(not $x21)))))))
(check-sat)
