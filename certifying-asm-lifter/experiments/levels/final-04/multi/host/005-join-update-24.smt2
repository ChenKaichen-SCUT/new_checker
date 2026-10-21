; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x109 (bvand p0-join-read-23 (_ bv1 2))))
(let (($x97 (= ?x109 ?x109)))
(not $x97))))
(check-sat)
