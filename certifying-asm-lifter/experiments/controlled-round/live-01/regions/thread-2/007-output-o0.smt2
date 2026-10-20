; benchmark generated from python API
(set-info :status unknown)
(declare-fun |entry:rcert_150e328a9c7e_0| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x43 (or true)))
(let ((?x44 (ite $x43 u0 |entry:rcert_150e328a9c7e_0|)))
(let (($x30 (or $x43)))
(let ((?x75 (ite $x30 ?x44 |entry:rcert_150e328a9c7e_0|)))
(let (($x67 (= u0 ?x75)))
(not $x67)))))))
(check-sat)
