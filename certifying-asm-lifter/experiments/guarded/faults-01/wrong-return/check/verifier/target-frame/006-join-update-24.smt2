; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x111 (bvand p0-join-read-23 (_ bv1 2))))
(let (($x3470 (= ?x111 ?x111)))
(not $x3470))))
(check-sat)
