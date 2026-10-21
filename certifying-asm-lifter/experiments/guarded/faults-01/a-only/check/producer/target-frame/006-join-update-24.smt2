; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x191 (bvand p0-join-read-23 (_ bv1 2))))
(let (($x549 (= ?x191 ?x191)))
(not $x549))))
(check-sat)
