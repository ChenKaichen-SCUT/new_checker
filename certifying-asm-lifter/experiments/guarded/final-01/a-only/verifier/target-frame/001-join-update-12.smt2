; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x3965 (bvand p0-join-read-11 (_ bv1 2))))
(let (($x2694 (= ?x3965 ?x3965)))
(not $x2694))))
(check-sat)
