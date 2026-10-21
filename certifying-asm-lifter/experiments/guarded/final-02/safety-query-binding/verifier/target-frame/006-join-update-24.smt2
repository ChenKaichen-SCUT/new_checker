; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x5532 (bvand p0-join-read-23 (_ bv1 2))))
(let (($x2857 (= ?x5532 ?x5532)))
(not $x2857))))
(check-sat)
