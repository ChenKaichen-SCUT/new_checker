; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x43 (bvand p0-join-read-11 (_ bv1 2))))
(let (($x121 (= ?x43 ?x43)))
(not $x121))))
(check-sat)
