; benchmark generated from python API
(set-info :status unknown)
(declare-fun |entry:rcert_150e328a9c7e_0| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x41 (or true)))
(let ((?x20 (ite $x41 u0 |entry:rcert_150e328a9c7e_0|)))
(let (($x50 (or $x41)))
(let ((?x56 (ite $x50 ?x20 |entry:rcert_150e328a9c7e_0|)))
(let (($x46 (= u0 ?x56)))
(not $x46)))))))
(check-sat)
