; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x216 (bvand p0-join-read-23 (_ bv1 2))))
(let (($x8634 (= ?x216 ?x216)))
(not $x8634))))
(check-sat)
