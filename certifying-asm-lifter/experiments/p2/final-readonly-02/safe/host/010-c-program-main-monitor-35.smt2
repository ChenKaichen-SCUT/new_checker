; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-main-read-0 () (_ BitVec 32))
(assert
 (let (($x7 (and (distinct (_ bv0 32) p0-main-read-0) true)))
(let (($x19 (= $x7 $x7)))
(not $x19))))
(check-sat)
