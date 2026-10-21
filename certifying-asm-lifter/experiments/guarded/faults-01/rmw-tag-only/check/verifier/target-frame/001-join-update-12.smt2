; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x818 (bvand p0-join-read-11 (_ bv1 2))))
(let (($x8326 (= ?x818 ?x818)))
(not $x8326))))
(check-sat)
