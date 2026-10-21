; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x88 (bvand p0-join-read-23 (_ bv1 2))))
(let (($x8634 (= ?x88 ?x88)))
(not $x8634))))
(check-sat)
