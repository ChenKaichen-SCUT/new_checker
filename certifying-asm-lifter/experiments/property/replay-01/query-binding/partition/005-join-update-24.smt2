; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x1763 (bvand p0-join-read-23 (_ bv1 2))))
(let (($x409 (= ?x1763 ?x1763)))
(not $x409))))
(check-sat)
