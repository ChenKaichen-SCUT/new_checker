; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x546 (bvand p0-join-read-23 (_ bv1 2))))
(let (($x581 (= ?x546 ?x546)))
(not $x581))))
(check-sat)
