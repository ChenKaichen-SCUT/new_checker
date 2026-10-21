; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x1458 (bvand finish (_ bv2 2))))
(let (($x3033 (= ?x1458 ?x1458)))
(not $x3033))))
(check-sat)
