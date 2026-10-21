; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x204 (bvand p0-join-read-23 (_ bv1 2))))
(let (($x5532 (= ?x204 ?x204)))
(not $x5532))))
(check-sat)
