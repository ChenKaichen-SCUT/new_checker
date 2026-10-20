; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x55 (bvand p0-join-read-23 (_ bv1 2))))
(let (($x21 (= ?x55 ?x55)))
(not $x21))))
(check-sat)
