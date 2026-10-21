; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x8 (bvand p0-join-read-23 (_ bv1 2))))
(let (($x38 (= ?x8 ?x8)))
(not $x38))))
(check-sat)
