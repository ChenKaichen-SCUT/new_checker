; benchmark generated from python API
(set-info :status unknown)
(declare-fun |in:v0| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x62 (= u0 |in:v0|)))
(let (($x17 (= $x62 $x62)))
(not $x17))))
(check-sat)
