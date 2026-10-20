; benchmark generated from python API
(set-info :status unknown)
(declare-fun |in:expected| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x9 (= u0 |in:expected|)))
(let (($x11 (= $x9 $x9)))
(not $x11))))
(check-sat)
