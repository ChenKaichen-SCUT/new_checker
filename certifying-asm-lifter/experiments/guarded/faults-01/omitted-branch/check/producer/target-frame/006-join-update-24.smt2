; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x89 (bvand p0-join-read-23 (_ bv1 2))))
(let (($x104 (= ?x89 ?x89)))
(not $x104))))
(check-sat)
