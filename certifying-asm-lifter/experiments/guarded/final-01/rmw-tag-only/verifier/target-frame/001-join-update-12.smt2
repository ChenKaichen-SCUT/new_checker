; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x7878 (bvand p0-join-read-11 (_ bv1 2))))
(let (($x7242 (= ?x7878 ?x7878)))
(not $x7242))))
(check-sat)
