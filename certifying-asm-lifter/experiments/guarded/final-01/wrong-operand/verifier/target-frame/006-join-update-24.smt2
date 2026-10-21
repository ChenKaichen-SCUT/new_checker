; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x5681 (bvand p0-join-read-23 (_ bv1 2))))
(let (($x1200 (= ?x5681 ?x5681)))
(not $x1200))))
(check-sat)
