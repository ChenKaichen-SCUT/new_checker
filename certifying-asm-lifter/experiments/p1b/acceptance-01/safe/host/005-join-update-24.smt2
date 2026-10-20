; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x52 (bvand p0-join-read-23 (_ bv1 2))))
(let (($x43 (= ?x52 ?x52)))
(not $x43))))
(check-sat)
