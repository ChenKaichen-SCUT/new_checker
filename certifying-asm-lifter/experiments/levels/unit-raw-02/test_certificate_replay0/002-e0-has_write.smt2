; benchmark generated from python API
(set-info :status unknown)
(declare-fun |in:expected| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x30 (= u0 |in:expected|)))
(let (($x42 (= $x30 $x30)))
(not $x42))))
(check-sat)
