; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x3352 (bvand finish (_ bv2 2))))
(let (($x3479 (= ?x3352 ?x3352)))
(not $x3479))))
(check-sat)
