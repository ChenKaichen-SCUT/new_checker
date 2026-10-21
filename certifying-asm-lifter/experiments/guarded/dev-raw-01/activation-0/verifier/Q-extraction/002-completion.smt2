; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x71 (bvand finish (_ bv2 2))))
(let (($x16 (= ?x71 ?x71)))
(not $x16))))
(check-sat)
