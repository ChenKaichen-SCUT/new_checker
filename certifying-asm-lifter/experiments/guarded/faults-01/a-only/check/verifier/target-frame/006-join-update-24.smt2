; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x355 (bvand p0-join-read-23 (_ bv1 2))))
(let (($x4522 (= ?x355 ?x355)))
(not $x4522))))
(check-sat)
