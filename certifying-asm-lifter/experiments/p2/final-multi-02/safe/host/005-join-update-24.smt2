; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x24 (bvand p0-join-read-23 (_ bv1 2))))
(let (($x71 (= ?x24 ?x24)))
(not $x71))))
(check-sat)
