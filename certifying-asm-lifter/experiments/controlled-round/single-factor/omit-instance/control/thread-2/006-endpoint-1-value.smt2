; benchmark generated from python API
(set-info :status unknown)
(declare-fun |entry:rcert_d0c1dc0e6121_0| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x58 (or true)))
(let ((?x33 (ite $x58 u0 |entry:rcert_d0c1dc0e6121_0|)))
(let ((?x41 (bvadd ?x33 (_ bv1 32))))
(let ((?x47 (bvadd u0 (_ bv1 32))))
(let (($x17 (=> true (= ?x47 ?x41))))
(not $x17)))))))
(check-sat)
