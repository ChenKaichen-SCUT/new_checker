; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x4311 (bvand p0-join-read-23 (_ bv1 2))))
(let (($x114 (= ?x4311 ?x4311)))
(not $x114))))
(check-sat)
