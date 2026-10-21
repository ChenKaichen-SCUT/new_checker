; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x8856 (bvand p0-join-read-23 (_ bv1 2))))
(let (($x6311 (= ?x8856 ?x8856)))
(not $x6311))))
(check-sat)
