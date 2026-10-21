; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x3741 (bvand p0-join-read-23 (_ bv1 2))))
(let (($x7454 (= ?x3741 ?x3741)))
(not $x7454))))
(check-sat)
