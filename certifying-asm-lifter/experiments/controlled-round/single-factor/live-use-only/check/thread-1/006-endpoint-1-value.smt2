; benchmark generated from python API
(set-info :status unknown)
(declare-fun |entry:rcert_150e328a9c7e_0| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x35 (or true)))
(let ((?x65 (ite $x35 u0 |entry:rcert_150e328a9c7e_0|)))
(let ((?x42 (bvadd ?x65 (_ bv1 32))))
(let ((?x47 (bvadd u0 (_ bv1 32))))
(let (($x22 (=> true (= ?x47 ?x42))))
(not $x22)))))))
(check-sat)
