; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x3262 (bvand p0-join-read-11 (_ bv1 2))))
(let (($x7658 (= ?x3262 ?x3262)))
(not $x7658))))
(check-sat)
