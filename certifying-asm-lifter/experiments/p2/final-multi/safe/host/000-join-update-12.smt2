; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x31 (bvand p0-join-read-11 (_ bv1 2))))
(let (($x34 (= ?x31 ?x31)))
(not $x34))))
(check-sat)
