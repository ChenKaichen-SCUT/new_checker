; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x3330 (bvand p0-join-read-23 (_ bv1 2))))
(let (($x7478 (= ?x3330 ?x3330)))
(not $x7478))))
(check-sat)
