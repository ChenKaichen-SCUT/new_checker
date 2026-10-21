; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x3109 (bvand p0-join-read-11 (_ bv1 2))))
(let (($x7628 (= ?x3109 ?x3109)))
(not $x7628))))
(check-sat)
