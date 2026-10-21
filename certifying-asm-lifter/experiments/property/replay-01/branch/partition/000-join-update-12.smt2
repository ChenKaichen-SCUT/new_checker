; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x341 (bvand p0-join-read-11 (_ bv1 2))))
(let (($x463 (= ?x341 ?x341)))
(not $x463))))
(check-sat)
