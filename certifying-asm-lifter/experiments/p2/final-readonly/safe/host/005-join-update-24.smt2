; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x45 (bvand p0-join-read-23 (_ bv1 2))))
(let (($x36 (= ?x45 ?x45)))
(not $x36))))
(check-sat)
