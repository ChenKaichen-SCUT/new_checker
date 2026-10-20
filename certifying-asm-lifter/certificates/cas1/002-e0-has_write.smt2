; benchmark generated from python API
(set-info :status unknown)
(declare-fun |in:expected| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x19 (= u0 |in:expected|)))
(let (($x10 (= $x19 $x19)))
(not $x10))))
(check-sat)
