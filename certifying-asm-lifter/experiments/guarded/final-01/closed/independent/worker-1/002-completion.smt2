; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x6311 (bvand finish (_ bv2 2))))
(let (($x7478 (= ?x6311 ?x6311)))
(not $x7478))))
(check-sat)
