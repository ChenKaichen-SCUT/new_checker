; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-main-read-0 () (_ BitVec 32))
(assert
 (let (($x3196 (= (_ bv1 32) p0-main-read-0)))
(let (($x106 (= $x3196 $x3196)))
(not $x106))))
(check-sat)
