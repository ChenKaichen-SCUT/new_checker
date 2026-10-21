; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x557 (bvand p0-join-read-23 (_ bv1 2))))
(let (($x3209 (= ?x557 ?x557)))
(not $x3209))))
(check-sat)
