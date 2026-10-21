; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x57 (bvand p0-join-read-23 (_ bv1 2))))
(let (($x50 (= ?x57 ?x57)))
(not $x50))))
(check-sat)
