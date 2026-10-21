; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x72 (bvand p0-join-read-11 (_ bv1 2))))
(let (($x73 (= ?x72 ?x72)))
(not $x73))))
(check-sat)
