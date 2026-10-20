; benchmark generated from python API
(set-info :status unknown)
(declare-fun |in:v0| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x21 (= u0 |in:v0|)))
(let (($x13 (= $x21 $x21)))
(not $x13))))
(check-sat)
