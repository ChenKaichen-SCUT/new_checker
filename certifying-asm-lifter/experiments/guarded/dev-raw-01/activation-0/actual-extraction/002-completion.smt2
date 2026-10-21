; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x46 (bvand finish (_ bv2 2))))
(let (($x43 (= ?x46 ?x46)))
(not $x43))))
(check-sat)
