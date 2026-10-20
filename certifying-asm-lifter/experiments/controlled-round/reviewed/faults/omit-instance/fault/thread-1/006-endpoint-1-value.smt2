; benchmark generated from python API
(set-info :status unknown)
(declare-fun |entry:rcert_d0c1dc0e6121_0| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x65 (or true)))
(let ((?x43 (ite $x65 u0 |entry:rcert_d0c1dc0e6121_0|)))
(let ((?x64 (bvadd ?x43 (_ bv1 32))))
(let ((?x6 (bvadd u0 (_ bv1 32))))
(let (($x7 (=> true (= ?x6 ?x64))))
(not $x7)))))))
(check-sat)
