; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x4362 (bvand p0-join-read-11 (_ bv1 2))))
(let (($x258 (= ?x4362 ?x4362)))
(not $x258))))
(check-sat)
