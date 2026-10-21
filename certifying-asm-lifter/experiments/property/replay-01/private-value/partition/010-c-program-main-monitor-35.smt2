; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-main-read-0 () (_ BitVec 32))
(assert
 (let (($x576 (and (distinct (_ bv0 32) p0-main-read-0) true)))
(let (($x412 (= $x576 $x576)))
(not $x412))))
(check-sat)
