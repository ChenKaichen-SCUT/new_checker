; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x4253 (bvand finish (_ bv2 2))))
(let (($x1076 (= ?x4253 ?x4253)))
(not $x1076))))
(check-sat)
