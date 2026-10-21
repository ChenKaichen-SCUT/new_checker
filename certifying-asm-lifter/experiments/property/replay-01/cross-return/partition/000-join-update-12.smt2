; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x581 (bvand p0-join-read-11 (_ bv1 2))))
(let (($x737 (= ?x581 ?x581)))
(not $x737))))
(check-sat)
