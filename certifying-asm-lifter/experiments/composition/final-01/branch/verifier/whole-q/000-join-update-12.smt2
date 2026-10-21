; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x64 (bvand p0-join-read-11 (_ bv1 2))))
(let (($x24 (= ?x64 ?x64)))
(not $x24))))
(check-sat)
