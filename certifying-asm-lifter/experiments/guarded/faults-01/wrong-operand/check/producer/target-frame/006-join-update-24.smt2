; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x173 (bvand p0-join-read-23 (_ bv1 2))))
(let (($x275 (= ?x173 ?x173)))
(not $x275))))
(check-sat)
