; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x33 (bvand p0-join-read-11 (_ bv1 2))))
(let (($x21 (= ?x33 ?x33)))
(not $x21))))
(check-sat)
