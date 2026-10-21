; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x2283 (bvand p0-join-read-23 (_ bv1 2))))
(let (($x7628 (= ?x2283 ?x2283)))
(not $x7628))))
(check-sat)
