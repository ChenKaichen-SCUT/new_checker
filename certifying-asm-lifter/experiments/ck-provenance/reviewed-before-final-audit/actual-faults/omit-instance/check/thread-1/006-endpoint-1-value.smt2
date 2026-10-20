; benchmark generated from python API
(set-info :status unknown)
(declare-fun |entry:rcert_1b3ee8f16fc7_0| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x16 (or true)))
(let ((?x56 (ite $x16 u0 |entry:rcert_1b3ee8f16fc7_0|)))
(let ((?x59 (bvadd ?x56 (_ bv1 32))))
(let ((?x77 (bvadd u0 (_ bv1 32))))
(let (($x40 (=> true (= ?x77 ?x59))))
(not $x40)))))))
(check-sat)
