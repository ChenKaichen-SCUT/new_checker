; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x751 (bvand p0-join-read-11 (_ bv1 2))))
(let (($x1246 (= ?x751 ?x751)))
(not $x1246))))
(check-sat)
