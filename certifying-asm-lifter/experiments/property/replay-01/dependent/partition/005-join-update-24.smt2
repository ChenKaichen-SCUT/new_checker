; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x477 (bvand p0-join-read-23 (_ bv1 2))))
(let (($x445 (= ?x477 ?x477)))
(not $x445))))
(check-sat)
