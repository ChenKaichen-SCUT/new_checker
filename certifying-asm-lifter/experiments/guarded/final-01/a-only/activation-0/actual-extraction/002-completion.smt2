; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x4928 (bvand finish (_ bv2 2))))
(let (($x2371 (= ?x4928 ?x4928)))
(not $x2371))))
(check-sat)
