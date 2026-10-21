; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x107 (bvand p0-join-read-11 (_ bv1 2))))
(let (($x88 (= ?x107 ?x107)))
(not $x88))))
(check-sat)
