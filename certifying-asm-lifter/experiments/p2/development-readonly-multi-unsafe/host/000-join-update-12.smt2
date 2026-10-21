; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x507 (bvand p0-join-read-11 (_ bv1 2))))
(let (($x2136 (= ?x507 ?x507)))
(not $x2136))))
(check-sat)
