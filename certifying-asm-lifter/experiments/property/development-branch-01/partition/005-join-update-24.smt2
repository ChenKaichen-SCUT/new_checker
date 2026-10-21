; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x133 (bvand p0-join-read-23 (_ bv1 2))))
(let (($x132 (= ?x133 ?x133)))
(not $x132))))
(check-sat)
