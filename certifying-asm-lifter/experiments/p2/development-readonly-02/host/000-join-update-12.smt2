; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x17 (bvand p0-join-read-11 (_ bv1 2))))
(let (($x36 (= ?x17 ?x17)))
(not $x36))))
(check-sat)
