; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x401 (bvand p0-join-read-23 (_ bv1 2))))
(let (($x385 (= ?x401 ?x401)))
(not $x385))))
(check-sat)
