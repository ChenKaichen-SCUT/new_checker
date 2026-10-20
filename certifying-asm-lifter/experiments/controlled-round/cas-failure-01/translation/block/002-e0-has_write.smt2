; benchmark generated from python API
(set-info :status unknown)
(declare-fun |in:v0| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x36 (= u0 |in:v0|)))
(let (($x28 (= $x36 $x36)))
(not $x28))))
(check-sat)
