; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x4528 (bvand p0-join-read-11 (_ bv1 2))))
(let (($x3736 (= ?x4528 ?x4528)))
(not $x3736))))
(check-sat)
