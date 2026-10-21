; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x4836 (bvand finish (_ bv2 2))))
(let (($x4559 (= ?x4836 ?x4836)))
(not $x4559))))
(check-sat)
