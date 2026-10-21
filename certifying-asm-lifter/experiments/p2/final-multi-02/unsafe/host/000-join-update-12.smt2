; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x59 (bvand p0-join-read-11 (_ bv1 2))))
(let (($x49 (= ?x59 ?x59)))
(not $x49))))
(check-sat)
