; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x7699 (bvand p0-join-read-23 (_ bv1 2))))
(let (($x8932 (= ?x7699 ?x7699)))
(not $x8932))))
(check-sat)
