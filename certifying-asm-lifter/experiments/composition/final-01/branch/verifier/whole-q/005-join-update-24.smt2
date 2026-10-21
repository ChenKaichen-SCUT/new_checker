; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x17 (bvand p0-join-read-23 (_ bv1 2))))
(let (($x141 (= ?x17 ?x17)))
(not $x141))))
(check-sat)
