; benchmark generated from python API
(set-info :status unknown)
(declare-fun |entry:rcert_150e328a9c7e_0| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x48 (or true)))
(let ((?x42 (ite $x48 u0 |entry:rcert_150e328a9c7e_0|)))
(let (($x17 (or $x48)))
(let ((?x22 (ite $x17 ?x42 |entry:rcert_150e328a9c7e_0|)))
(let (($x14 (= u0 ?x22)))
(not $x14)))))))
(check-sat)
