; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x141 (bvand p0-join-read-11 (_ bv1 2))))
(let (($x93 (= ?x141 ?x141)))
(not $x93))))
(check-sat)
