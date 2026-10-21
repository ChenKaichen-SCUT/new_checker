; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x4101 (bvand p0-join-read-23 (_ bv1 2))))
(let (($x1746 (= ?x4101 ?x4101)))
(not $x1746))))
(check-sat)
