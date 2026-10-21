; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x63 (bvand p0-join-read-23 (_ bv1 2))))
(let (($x124 (= ?x63 ?x63)))
(not $x124))))
(check-sat)
