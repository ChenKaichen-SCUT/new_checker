; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x7478 (bvand p0-join-read-11 (_ bv1 2))))
(let (($x6894 (= ?x7478 ?x7478)))
(not $x6894))))
(check-sat)
