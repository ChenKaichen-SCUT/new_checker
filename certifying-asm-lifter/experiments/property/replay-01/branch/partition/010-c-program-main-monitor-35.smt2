; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-main-read-0 () (_ BitVec 32))
(assert
 (let (($x1167 (and (distinct (_ bv0 32) p0-main-read-0) true)))
(let (($x450 (= $x1167 $x1167)))
(not $x450))))
(check-sat)
