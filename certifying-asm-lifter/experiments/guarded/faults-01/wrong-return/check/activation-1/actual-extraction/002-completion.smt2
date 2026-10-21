; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x55 (bvand finish (_ bv2 2))))
(let (($x246 (= ?x55 ?x55)))
(not $x246))))
(check-sat)
