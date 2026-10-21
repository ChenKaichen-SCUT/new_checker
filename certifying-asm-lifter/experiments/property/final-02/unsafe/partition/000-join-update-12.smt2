; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x34 (bvand p0-join-read-11 (_ bv1 2))))
(let (($x65 (= ?x34 ?x34)))
(not $x65))))
(check-sat)
