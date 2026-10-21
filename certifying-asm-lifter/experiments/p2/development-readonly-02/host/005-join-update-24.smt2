; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x44 (bvand p0-join-read-23 (_ bv1 2))))
(let (($x42 (= ?x44 ?x44)))
(not $x42))))
(check-sat)
