; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x51 (bvand p0-join-read-11 (_ bv1 2))))
(let (($x5175 (= ?x51 ?x51)))
(not $x5175))))
(check-sat)
