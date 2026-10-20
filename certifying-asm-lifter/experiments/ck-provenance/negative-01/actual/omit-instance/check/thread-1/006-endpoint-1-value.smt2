; benchmark generated from python API
(set-info :status unknown)
(declare-fun |entry:rcert_1b3ee8f16fc7_0| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x13 (or true)))
(let ((?x39 (ite $x13 u0 |entry:rcert_1b3ee8f16fc7_0|)))
(let ((?x48 (bvadd ?x39 (_ bv1 32))))
(let ((?x65 (bvadd u0 (_ bv1 32))))
(let (($x66 (=> true (= ?x65 ?x48))))
(not $x66)))))))
(check-sat)
