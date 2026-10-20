; benchmark generated from python API
(set-info :status unknown)
(declare-fun |entry:rcert_150e328a9c7e_0| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x43 (or true)))
(let ((?x11 (ite $x43 u0 |entry:rcert_150e328a9c7e_0|)))
(let (($x17 (or $x43)))
(let ((?x73 (ite $x17 ?x11 |entry:rcert_150e328a9c7e_0|)))
(let (($x67 (= u0 ?x73)))
(not $x67)))))))
(check-sat)
