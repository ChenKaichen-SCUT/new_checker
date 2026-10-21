; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-main-read-0 () (_ BitVec 32))
(assert
 (let (($x1546 (and (distinct (_ bv0 32) p0-main-read-0) true)))
(let (($x381 (= $x1546 $x1546)))
(not $x381))))
(check-sat)
