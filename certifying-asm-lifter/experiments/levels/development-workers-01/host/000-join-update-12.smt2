; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x16 (bvand p0-join-read-11 (_ bv1 2))))
(let (($x8 (= ?x16 ?x16)))
(not $x8))))
(check-sat)
