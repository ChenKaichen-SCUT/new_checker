; benchmark generated from python API
(set-info :status unknown)
(declare-fun |in:v0| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x61 (= u0 |in:v0|)))
(let (($x45 (= $x61 $x61)))
(not $x45))))
(check-sat)
