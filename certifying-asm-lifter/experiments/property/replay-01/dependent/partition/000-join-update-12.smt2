; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x76 (bvand p0-join-read-11 (_ bv1 2))))
(let (($x1167 (= ?x76 ?x76)))
(not $x1167))))
(check-sat)
