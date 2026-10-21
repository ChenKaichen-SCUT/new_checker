; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x2972 (bvand p0-join-read-23 (_ bv1 2))))
(let (($x408 (= ?x2972 ?x2972)))
(not $x408))))
(check-sat)
