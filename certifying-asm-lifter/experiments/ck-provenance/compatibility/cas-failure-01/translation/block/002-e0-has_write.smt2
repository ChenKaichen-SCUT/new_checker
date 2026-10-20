; benchmark generated from python API
(set-info :status unknown)
(declare-fun |in:v0| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x77 (= u0 |in:v0|)))
(let (($x19 (= $x77 $x77)))
(not $x19))))
(check-sat)
