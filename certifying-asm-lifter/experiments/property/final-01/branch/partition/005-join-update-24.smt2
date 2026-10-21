; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x127 (bvand p0-join-read-23 (_ bv1 2))))
(let (($x120 (= ?x127 ?x127)))
(not $x120))))
(check-sat)
