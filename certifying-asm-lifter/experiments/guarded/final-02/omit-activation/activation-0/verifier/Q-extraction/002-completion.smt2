; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x37 (bvand finish (_ bv2 2))))
(let (($x582 (= ?x37 ?x37)))
(not $x582))))
(check-sat)
