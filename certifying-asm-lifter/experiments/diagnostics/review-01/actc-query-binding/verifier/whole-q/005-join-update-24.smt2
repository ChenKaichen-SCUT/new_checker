; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x25 (bvand p0-join-read-23 (_ bv1 2))))
(let (($x60 (= ?x25 ?x25)))
(not $x60))))
(check-sat)
