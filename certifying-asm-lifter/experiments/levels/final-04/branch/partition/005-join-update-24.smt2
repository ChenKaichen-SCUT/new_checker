; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x5 (bvand p0-join-read-23 (_ bv1 2))))
(let (($x95 (= ?x5 ?x5)))
(not $x95))))
(check-sat)
