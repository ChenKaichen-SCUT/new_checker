; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x2919 (bvand p0-join-read-11 (_ bv1 2))))
(let (($x2297 (= ?x2919 ?x2919)))
(not $x2297))))
(check-sat)
