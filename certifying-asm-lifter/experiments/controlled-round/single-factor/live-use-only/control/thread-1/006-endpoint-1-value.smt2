; benchmark generated from python API
(set-info :status unknown)
(declare-fun |entry:rcert_150e328a9c7e_0| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x26 (or true)))
(let ((?x35 (ite $x26 u0 |entry:rcert_150e328a9c7e_0|)))
(let ((?x30 (bvadd ?x35 (_ bv1 32))))
(let ((?x45 (bvadd u0 (_ bv1 32))))
(let (($x23 (=> true (= ?x45 ?x30))))
(not $x23)))))))
(check-sat)
