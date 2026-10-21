; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x527 (bvand p0-join-read-11 (_ bv1 2))))
(let (($x3117 (= ?x527 ?x527)))
(not $x3117))))
(check-sat)
