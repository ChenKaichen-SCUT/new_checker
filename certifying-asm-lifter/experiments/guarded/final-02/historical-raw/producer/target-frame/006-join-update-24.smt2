; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x4385 (bvand p0-join-read-23 (_ bv1 2))))
(let (($x59 (= ?x4385 ?x4385)))
(not $x59))))
(check-sat)
