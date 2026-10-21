; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x127 (bvand p0-join-read-11 (_ bv1 2))))
(let (($x3071 (= ?x127 ?x127)))
(not $x3071))))
(check-sat)
