; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x18 (bvand p0-join-read-11 (_ bv1 2))))
(let (($x10 (= ?x18 ?x18)))
(not $x10))))
(check-sat)
