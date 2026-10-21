; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x3305 (bvand finish (_ bv2 2))))
(let (($x6037 (= ?x3305 ?x3305)))
(not $x6037))))
(check-sat)
