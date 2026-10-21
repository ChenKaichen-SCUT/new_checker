; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-main-read-0 () (_ BitVec 32))
(assert
 (let (($x3030 (= (_ bv1 32) p0-main-read-0)))
(let (($x24 (= $x3030 $x3030)))
(not $x24))))
(check-sat)
