; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x6393 (bvand finish (_ bv2 2))))
(let (($x190 (= ?x6393 ?x6393)))
(not $x190))))
(check-sat)
