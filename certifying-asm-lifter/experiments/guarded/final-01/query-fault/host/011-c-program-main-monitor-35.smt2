; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-main-read-0 () (_ BitVec 32))
(assert
 (let (($x4163 (= (_ bv1 32) p0-main-read-0)))
(let (($x2070 (= $x4163 $x4163)))
(not $x2070))))
(check-sat)
