; benchmark generated from python API
(set-info :status unknown)
(declare-fun |in:expected| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x23 (= u0 |in:expected|)))
(let (($x14 (= $x23 $x23)))
(not $x14))))
(check-sat)
