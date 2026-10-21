; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x28 (bvand p0-join-read-11 (_ bv1 2))))
(let (($x2324 (= ?x28 ?x28)))
(not $x2324))))
(check-sat)
