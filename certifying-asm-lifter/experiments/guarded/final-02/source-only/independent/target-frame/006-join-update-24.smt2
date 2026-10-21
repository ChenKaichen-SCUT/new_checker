; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x824 (bvand p0-join-read-23 (_ bv1 2))))
(let (($x2069 (= ?x824 ?x824)))
(not $x2069))))
(check-sat)
