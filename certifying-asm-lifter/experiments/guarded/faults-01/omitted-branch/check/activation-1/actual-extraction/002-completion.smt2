; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x5662 (bvand finish (_ bv2 2))))
(let (($x137 (= ?x5662 ?x5662)))
(not $x137))))
(check-sat)
