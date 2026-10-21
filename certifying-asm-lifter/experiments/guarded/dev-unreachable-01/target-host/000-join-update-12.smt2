; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x3563 (bvand p0-join-read-11 (_ bv1 2))))
(let (($x3599 (= ?x3563 ?x3563)))
(not $x3599))))
(check-sat)
