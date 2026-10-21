; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x6721 (bvand finish (_ bv2 2))))
(let (($x2280 (= ?x6721 ?x6721)))
(not $x2280))))
(check-sat)
