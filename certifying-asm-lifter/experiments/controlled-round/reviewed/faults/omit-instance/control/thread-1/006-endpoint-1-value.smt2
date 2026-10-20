; benchmark generated from python API
(set-info :status unknown)
(declare-fun |entry:rcert_d0c1dc0e6121_0| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x64 (or true)))
(let ((?x8 (ite $x64 u0 |entry:rcert_d0c1dc0e6121_0|)))
(let ((?x33 (bvadd ?x8 (_ bv1 32))))
(let ((?x51 (bvadd u0 (_ bv1 32))))
(let (($x6 (=> true (= ?x51 ?x33))))
(not $x6)))))))
(check-sat)
