; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x7564 (bvand p0-join-read-23 (_ bv1 2))))
(let (($x3484 (= ?x7564 ?x7564)))
(not $x3484))))
(check-sat)
