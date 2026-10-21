; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x8741 (bvand p0-join-read-23 (_ bv1 2))))
(let (($x3175 (= ?x8741 ?x8741)))
(not $x3175))))
(check-sat)
