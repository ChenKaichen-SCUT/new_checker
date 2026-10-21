; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x8634 (bvand p0-join-read-11 (_ bv1 2))))
(let (($x7032 (= ?x8634 ?x8634)))
(not $x7032))))
(check-sat)
