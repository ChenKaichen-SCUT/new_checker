; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x7462 (bvand p0-join-read-23 (_ bv1 2))))
(let (($x174 (= ?x7462 ?x7462)))
(not $x174))))
(check-sat)
