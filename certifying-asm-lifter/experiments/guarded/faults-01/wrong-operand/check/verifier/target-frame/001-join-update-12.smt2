; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x242 (bvand p0-join-read-11 (_ bv1 2))))
(let (($x5253 (= ?x242 ?x242)))
(not $x5253))))
(check-sat)
