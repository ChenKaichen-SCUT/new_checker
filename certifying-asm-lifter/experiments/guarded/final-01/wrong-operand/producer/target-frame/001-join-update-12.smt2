; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x1700 (bvand p0-join-read-11 (_ bv1 2))))
(let (($x3553 (= ?x1700 ?x1700)))
(not $x3553))))
(check-sat)
