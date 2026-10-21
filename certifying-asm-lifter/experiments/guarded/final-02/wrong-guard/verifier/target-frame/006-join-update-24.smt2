; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x3237 (bvand p0-join-read-23 (_ bv1 2))))
(let (($x197 (= ?x3237 ?x3237)))
(not $x197))))
(check-sat)
