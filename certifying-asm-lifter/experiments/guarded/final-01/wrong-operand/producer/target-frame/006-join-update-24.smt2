; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x835 (bvand p0-join-read-23 (_ bv1 2))))
(let (($x8958 (= ?x835 ?x835)))
(not $x8958))))
(check-sat)
