; benchmark generated from python API
(set-info :status unknown)
(declare-fun |entry:rcert_150e328a9c7e_0| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x21 (or true)))
(let ((?x64 (ite $x21 u0 |entry:rcert_150e328a9c7e_0|)))
(let (($x68 (or $x21)))
(let ((?x7 (ite $x68 ?x64 |entry:rcert_150e328a9c7e_0|)))
(let (($x49 (= u0 ?x7)))
(not $x49)))))))
(check-sat)
