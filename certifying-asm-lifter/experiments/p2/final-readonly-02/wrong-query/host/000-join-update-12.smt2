; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x30 (bvand p0-join-read-11 (_ bv1 2))))
(let (($x23 (= ?x30 ?x30)))
(not $x23))))
(check-sat)
