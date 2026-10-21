; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-main-read-0 () (_ BitVec 32))
(assert
 (let (($x10 (and (distinct (_ bv0 32) p0-main-read-0) true)))
(let (($x98 (= $x10 $x10)))
(not $x98))))
(check-sat)
