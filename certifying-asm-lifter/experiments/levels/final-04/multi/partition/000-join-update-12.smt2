; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x82 (bvand p0-join-read-11 (_ bv1 2))))
(let (($x50 (= ?x82 ?x82)))
(not $x50))))
(check-sat)
