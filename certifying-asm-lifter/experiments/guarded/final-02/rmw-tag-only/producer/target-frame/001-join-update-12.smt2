; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x4661 (bvand p0-join-read-11 (_ bv1 2))))
(let (($x1999 (= ?x4661 ?x4661)))
(not $x1999))))
(check-sat)
