; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x742 (bvand p0-join-read-23 (_ bv1 2))))
(let (($x1509 (= ?x742 ?x742)))
(not $x1509))))
(check-sat)
