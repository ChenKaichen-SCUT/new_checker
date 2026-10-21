; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x377 (bvand p0-join-read-11 (_ bv1 2))))
(let (($x400 (= ?x377 ?x377)))
(not $x400))))
(check-sat)
