; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x559 (bvand p0-join-read-23 (_ bv1 2))))
(let (($x538 (= ?x559 ?x559)))
(not $x538))))
(check-sat)
