; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x123 (bvand p0-join-read-23 (_ bv1 2))))
(let (($x3873 (= ?x123 ?x123)))
(not $x3873))))
(check-sat)
