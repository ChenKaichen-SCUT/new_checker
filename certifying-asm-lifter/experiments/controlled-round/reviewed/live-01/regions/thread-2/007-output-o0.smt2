; benchmark generated from python API
(set-info :status unknown)
(declare-fun |entry:rcert_150e328a9c7e_0| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x9 (or true)))
(let ((?x21 (ite $x9 u0 |entry:rcert_150e328a9c7e_0|)))
(let (($x13 (or $x9)))
(let ((?x68 (ite $x13 ?x21 |entry:rcert_150e328a9c7e_0|)))
(let (($x66 (= u0 ?x68)))
(not $x66)))))))
(check-sat)
