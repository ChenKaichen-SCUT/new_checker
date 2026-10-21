; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x249 (bvand p0-join-read-23 (_ bv1 2))))
(let (($x5 (= ?x249 ?x249)))
(not $x5))))
(check-sat)
