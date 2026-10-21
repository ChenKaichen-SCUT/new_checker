; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x3023 (bvand p0-join-read-11 (_ bv1 2))))
(let (($x1791 (= ?x3023 ?x3023)))
(not $x1791))))
(check-sat)
