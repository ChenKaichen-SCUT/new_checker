; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x5108 (bvand p0-join-read-11 (_ bv1 2))))
(let (($x7496 (= ?x5108 ?x5108)))
(not $x7496))))
(check-sat)
