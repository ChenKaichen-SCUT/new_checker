; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x62 (bvand p0-join-read-23 (_ bv1 2))))
(let (($x11 (= ?x62 ?x62)))
(not $x11))))
(check-sat)
