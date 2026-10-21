; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x22 (bvand p0-join-read-11 (_ bv1 2))))
(let (($x10 (= ?x22 ?x22)))
(not $x10))))
(check-sat)
