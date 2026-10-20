; benchmark generated from python API
(set-info :status unknown)
(declare-fun |entry:rcert_150e328a9c7e_0| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x35 (or true)))
(let ((?x25 (ite $x35 u0 |entry:rcert_150e328a9c7e_0|)))
(let (($x27 (or $x35)))
(let ((?x37 (ite $x27 ?x25 |entry:rcert_150e328a9c7e_0|)))
(let (($x34 (= u0 ?x37)))
(not $x34)))))))
(check-sat)
