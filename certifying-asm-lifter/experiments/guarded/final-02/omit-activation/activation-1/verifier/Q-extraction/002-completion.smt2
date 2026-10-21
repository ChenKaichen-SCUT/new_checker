; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x5811 (bvand finish (_ bv2 2))))
(let (($x1845 (= ?x5811 ?x5811)))
(not $x1845))))
(check-sat)
