; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x4559 (bvand finish (_ bv2 2))))
(let (($x8554 (= ?x4559 ?x4559)))
(not $x8554))))
(check-sat)
