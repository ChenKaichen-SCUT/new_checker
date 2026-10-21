; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x21 (bvand p0-join-read-11 (_ bv1 2))))
(let (($x30 (= ?x21 ?x21)))
(not $x30))))
(check-sat)
