; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x7572 (bvand p0-join-read-23 (_ bv1 2))))
(let (($x206 (= ?x7572 ?x7572)))
(not $x206))))
(check-sat)
