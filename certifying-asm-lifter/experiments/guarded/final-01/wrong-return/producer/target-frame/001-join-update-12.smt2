; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x1357 (bvand p0-join-read-11 (_ bv1 2))))
(let (($x3041 (= ?x1357 ?x1357)))
(not $x3041))))
(check-sat)
