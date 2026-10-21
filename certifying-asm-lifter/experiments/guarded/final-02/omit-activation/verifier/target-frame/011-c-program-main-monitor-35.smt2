; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-main-read-0 () (_ BitVec 32))
(assert
 (let (($x2712 (= (_ bv1 32) p0-main-read-0)))
(let (($x3023 (= $x2712 $x2712)))
(not $x3023))))
(check-sat)
