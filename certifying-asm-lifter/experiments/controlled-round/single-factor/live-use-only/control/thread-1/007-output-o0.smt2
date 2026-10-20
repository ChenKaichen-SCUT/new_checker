; benchmark generated from python API
(set-info :status unknown)
(declare-fun |entry:rcert_150e328a9c7e_0| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x26 (or true)))
(let ((?x35 (ite $x26 u0 |entry:rcert_150e328a9c7e_0|)))
(let (($x13 (or $x26)))
(let ((?x47 (ite $x13 ?x35 |entry:rcert_150e328a9c7e_0|)))
(let (($x58 (= u0 ?x47)))
(not $x58)))))))
(check-sat)
