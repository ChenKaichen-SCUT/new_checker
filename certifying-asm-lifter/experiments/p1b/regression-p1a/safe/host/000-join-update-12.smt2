; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x44 (bvand p0-join-read-11 (_ bv1 2))))
(let (($x13 (= ?x44 ?x44)))
(not $x13))))
(check-sat)
