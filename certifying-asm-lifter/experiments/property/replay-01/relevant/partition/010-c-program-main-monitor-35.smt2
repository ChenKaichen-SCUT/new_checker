; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-main-read-0 () (_ BitVec 32))
(assert
 (let (($x151 (and (distinct (_ bv0 32) p0-main-read-0) true)))
(let (($x144 (= $x151 $x151)))
(not $x144))))
(check-sat)
