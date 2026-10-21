; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x3428 (bvand p0-join-read-23 (_ bv1 2))))
(let (($x6117 (= ?x3428 ?x3428)))
(not $x6117))))
(check-sat)
