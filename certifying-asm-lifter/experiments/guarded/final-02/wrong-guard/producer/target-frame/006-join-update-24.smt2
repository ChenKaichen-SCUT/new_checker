; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x99 (bvand p0-join-read-23 (_ bv1 2))))
(let (($x26 (= ?x99 ?x99)))
(not $x26))))
(check-sat)
