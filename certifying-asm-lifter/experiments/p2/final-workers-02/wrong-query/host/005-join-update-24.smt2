; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x38 (bvand p0-join-read-23 (_ bv1 2))))
(let (($x35 (= ?x38 ?x38)))
(not $x35))))
(check-sat)
