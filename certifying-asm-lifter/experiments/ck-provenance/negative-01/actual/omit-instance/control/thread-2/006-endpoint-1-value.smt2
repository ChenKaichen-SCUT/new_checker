; benchmark generated from python API
(set-info :status unknown)
(declare-fun |entry:rcert_1b3ee8f16fc7_0| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x64 (or true)))
(let ((?x72 (ite $x64 u0 |entry:rcert_1b3ee8f16fc7_0|)))
(let ((?x33 (bvadd ?x72 (_ bv1 32))))
(let ((?x57 (bvadd u0 (_ bv1 32))))
(let (($x59 (=> true (= ?x57 ?x33))))
(not $x59)))))))
(check-sat)
