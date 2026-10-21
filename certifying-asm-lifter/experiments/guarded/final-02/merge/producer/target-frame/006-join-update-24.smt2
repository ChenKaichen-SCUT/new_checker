; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x66 (bvand p0-join-read-23 (_ bv1 2))))
(let (($x59 (= ?x66 ?x66)))
(not $x59))))
(check-sat)
