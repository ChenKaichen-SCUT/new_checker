; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x150 (bvand p0-join-read-11 (_ bv1 2))))
(let (($x120 (= ?x150 ?x150)))
(not $x120))))
(check-sat)
