; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x21 (bvand p0-join-read-23 (_ bv1 2))))
(let (($x20 (= ?x21 ?x21)))
(not $x20))))
(check-sat)
