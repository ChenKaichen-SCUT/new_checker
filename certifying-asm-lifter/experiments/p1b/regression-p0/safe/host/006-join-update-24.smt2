; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x47 (bvand p0-join-read-23 (_ bv1 2))))
(let (($x14 (= ?x47 ?x47)))
(not $x14))))
(check-sat)
