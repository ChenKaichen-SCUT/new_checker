; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x70 (bvand p0-join-read-11 (_ bv1 2))))
(let (($x36 (= ?x70 ?x70)))
(not $x36))))
(check-sat)
