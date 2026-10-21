; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x90 (bvand p0-join-read-23 (_ bv1 2))))
(let (($x88 (= ?x90 ?x90)))
(not $x88))))
(check-sat)
