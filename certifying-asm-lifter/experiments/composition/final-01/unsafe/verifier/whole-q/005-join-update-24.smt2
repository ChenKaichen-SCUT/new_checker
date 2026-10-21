; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x12 (bvand p0-join-read-23 (_ bv1 2))))
(let (($x73 (= ?x12 ?x12)))
(not $x73))))
(check-sat)
