; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-main-read-0 () (_ BitVec 32))
(assert
 (let (($x5088 (= (_ bv1 32) p0-main-read-0)))
(let (($x106 (= $x5088 $x5088)))
(not $x106))))
(check-sat)
