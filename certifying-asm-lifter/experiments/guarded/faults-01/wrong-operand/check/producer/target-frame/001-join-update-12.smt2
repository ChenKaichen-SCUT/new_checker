; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x11 (bvand p0-join-read-11 (_ bv1 2))))
(let (($x116 (= ?x11 ?x11)))
(not $x116))))
(check-sat)
