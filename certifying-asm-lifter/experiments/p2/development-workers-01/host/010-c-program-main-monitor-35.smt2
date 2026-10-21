; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-main-read-0 () (_ BitVec 32))
(assert
 (let (($x24 (and (distinct (_ bv0 32) p0-main-read-0) true)))
(let (($x12 (= $x24 $x24)))
(not $x12))))
(check-sat)
