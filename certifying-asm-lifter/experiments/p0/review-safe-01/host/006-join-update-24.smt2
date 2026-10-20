; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x30 (bvand p0-join-read-23 (_ bv1 2))))
(let (($x24 (= ?x30 ?x30)))
(not $x24))))
(check-sat)
