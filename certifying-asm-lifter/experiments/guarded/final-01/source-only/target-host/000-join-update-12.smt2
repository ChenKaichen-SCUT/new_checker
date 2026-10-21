; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x6097 (bvand p0-join-read-11 (_ bv1 2))))
(let (($x8460 (= ?x6097 ?x6097)))
(not $x8460))))
(check-sat)
