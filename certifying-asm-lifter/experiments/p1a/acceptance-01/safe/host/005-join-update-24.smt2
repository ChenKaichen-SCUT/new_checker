; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x41 (bvand p0-join-read-23 (_ bv1 2))))
(let (($x51 (= ?x41 ?x41)))
(not $x51))))
(check-sat)
