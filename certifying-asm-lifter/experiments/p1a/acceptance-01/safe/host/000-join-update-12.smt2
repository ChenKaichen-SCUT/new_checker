; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x47 (bvand p0-join-read-11 (_ bv1 2))))
(let (($x44 (= ?x47 ?x47)))
(not $x44))))
(check-sat)
