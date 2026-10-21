; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x258 (bvand finish (_ bv2 2))))
(let (($x5656 (= ?x258 ?x258)))
(not $x5656))))
(check-sat)
