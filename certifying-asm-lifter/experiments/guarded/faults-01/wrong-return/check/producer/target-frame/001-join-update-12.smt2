; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x8719 (bvand p0-join-read-11 (_ bv1 2))))
(let (($x1281 (= ?x8719 ?x8719)))
(not $x1281))))
(check-sat)
