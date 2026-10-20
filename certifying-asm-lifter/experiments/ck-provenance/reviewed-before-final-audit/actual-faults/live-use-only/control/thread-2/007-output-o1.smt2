; benchmark generated from python API
(set-info :status unknown)
(declare-fun |entry:rcert_1b3ee8f16fc7_0| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x35 (or true)))
(let ((?x44 (ite $x35 u0 |entry:rcert_1b3ee8f16fc7_0|)))
(let (($x23 (or $x35)))
(let ((?x21 (ite $x23 ?x44 |entry:rcert_1b3ee8f16fc7_0|)))
(let (($x40 (= u0 ?x21)))
(not $x40)))))))
(check-sat)
