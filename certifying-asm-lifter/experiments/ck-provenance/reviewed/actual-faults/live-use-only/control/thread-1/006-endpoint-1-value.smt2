; benchmark generated from python API
(set-info :status unknown)
(declare-fun |entry:rcert_1b3ee8f16fc7_0| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x6 (or true)))
(let ((?x47 (ite $x6 u0 |entry:rcert_1b3ee8f16fc7_0|)))
(let ((?x31 (bvadd ?x47 (_ bv1 32))))
(let ((?x78 (bvadd u0 (_ bv1 32))))
(let (($x18 (=> true (= ?x78 ?x31))))
(not $x18)))))))
(check-sat)
