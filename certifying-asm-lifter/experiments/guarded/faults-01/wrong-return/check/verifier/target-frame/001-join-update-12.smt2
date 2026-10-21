; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x96 (bvand p0-join-read-11 (_ bv1 2))))
(let (($x179 (= ?x96 ?x96)))
(not $x179))))
(check-sat)
