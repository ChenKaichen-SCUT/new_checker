; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x128 (bvand p0-join-read-23 (_ bv1 2))))
(let (($x127 (= ?x128 ?x128)))
(not $x127))))
(check-sat)
