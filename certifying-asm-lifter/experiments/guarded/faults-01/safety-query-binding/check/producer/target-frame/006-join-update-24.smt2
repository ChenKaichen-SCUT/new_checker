; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x5033 (bvand p0-join-read-23 (_ bv1 2))))
(let (($x8766 (= ?x5033 ?x5033)))
(not $x8766))))
(check-sat)
