; benchmark generated from python API
(set-info :status unknown)
(declare-fun |entry:rcert_150e328a9c7e_0| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x18 (or true)))
(let ((?x30 (ite $x18 u0 |entry:rcert_150e328a9c7e_0|)))
(let (($x37 (or $x18)))
(let ((?x66 (ite $x37 ?x30 |entry:rcert_150e328a9c7e_0|)))
(let (($x31 (= u0 ?x66)))
(not $x31)))))))
(check-sat)
