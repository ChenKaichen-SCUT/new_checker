; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-main-read-0 () (_ BitVec 32))
(assert
 (let (($x538 (and (distinct (_ bv0 32) p0-main-read-0) true)))
(let (($x426 (= $x538 $x538)))
(not $x426))))
(check-sat)
