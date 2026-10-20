; benchmark generated from python API
(set-info :status unknown)
(declare-fun |entry:rcert_150e328a9c7e_0| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x35 (or true)))
(let ((?x65 (ite $x35 u0 |entry:rcert_150e328a9c7e_0|)))
(let (($x10 (or $x35)))
(let ((?x6 (ite $x10 ?x65 |entry:rcert_150e328a9c7e_0|)))
(let (($x45 (= u0 ?x6)))
(not $x45)))))))
(check-sat)
