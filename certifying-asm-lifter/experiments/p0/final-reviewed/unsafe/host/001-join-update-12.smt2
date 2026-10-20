; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x9 (bvand p0-join-read-11 (_ bv1 2))))
(let (($x63 (= ?x9 ?x9)))
(not $x63))))
(check-sat)
