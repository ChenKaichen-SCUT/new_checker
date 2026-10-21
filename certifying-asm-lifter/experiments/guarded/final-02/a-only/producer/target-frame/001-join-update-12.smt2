; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x7344 (bvand p0-join-read-11 (_ bv1 2))))
(let (($x1434 (= ?x7344 ?x7344)))
(not $x1434))))
(check-sat)
