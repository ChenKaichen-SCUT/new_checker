; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x52 (bvand p0-join-read-11 (_ bv1 2))))
(let (($x42 (= ?x52 ?x52)))
(not $x42))))
(check-sat)
