; benchmark generated from python API
(set-info :status unknown)
(declare-fun |entry:rcert_150e328a9c7e_0| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x48 (or true)))
(let ((?x42 (ite $x48 u0 |entry:rcert_150e328a9c7e_0|)))
(let ((?x44 (bvadd ?x42 (_ bv1 32))))
(let ((?x10 (bvadd u0 (_ bv1 32))))
(let (($x54 (=> true (= ?x10 ?x44))))
(not $x54)))))))
(check-sat)
