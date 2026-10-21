; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x95 (bvand finish (_ bv2 2))))
(let (($x92 (= ?x95 ?x95)))
(not $x92))))
(check-sat)
