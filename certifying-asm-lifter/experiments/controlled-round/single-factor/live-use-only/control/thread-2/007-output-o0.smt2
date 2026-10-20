; benchmark generated from python API
(set-info :status unknown)
(declare-fun |entry:rcert_150e328a9c7e_0| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x11 (or true)))
(let ((?x31 (ite $x11 u0 |entry:rcert_150e328a9c7e_0|)))
(let (($x68 (or $x11)))
(let ((?x53 (ite $x68 ?x31 |entry:rcert_150e328a9c7e_0|)))
(let (($x19 (= u0 ?x53)))
(not $x19)))))))
(check-sat)
