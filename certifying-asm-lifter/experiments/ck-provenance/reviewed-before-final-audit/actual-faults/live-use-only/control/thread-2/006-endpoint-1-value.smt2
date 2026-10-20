; benchmark generated from python API
(set-info :status unknown)
(declare-fun |entry:rcert_1b3ee8f16fc7_0| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x35 (or true)))
(let ((?x44 (ite $x35 u0 |entry:rcert_1b3ee8f16fc7_0|)))
(let ((?x70 (bvadd ?x44 (_ bv1 32))))
(let ((?x45 (bvadd u0 (_ bv1 32))))
(let (($x66 (=> true (= ?x45 ?x70))))
(not $x66)))))))
(check-sat)
