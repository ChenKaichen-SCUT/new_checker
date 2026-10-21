; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x93 (bvand p0-join-read-11 (_ bv1 2))))
(let (($x173 (= ?x93 ?x93)))
(not $x173))))
(check-sat)
