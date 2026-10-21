; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x542 (bvand p0-join-read-23 (_ bv1 2))))
(let (($x2525 (= ?x542 ?x542)))
(not $x2525))))
(check-sat)
