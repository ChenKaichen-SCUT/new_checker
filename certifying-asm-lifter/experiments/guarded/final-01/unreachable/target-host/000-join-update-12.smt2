; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x8660 (bvand p0-join-read-11 (_ bv1 2))))
(let (($x5540 (= ?x8660 ?x8660)))
(not $x5540))))
(check-sat)
