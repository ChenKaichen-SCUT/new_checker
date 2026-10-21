; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x1510 (bvand p0-join-read-23 (_ bv1 2))))
(let (($x370 (= ?x1510 ?x1510)))
(not $x370))))
(check-sat)
