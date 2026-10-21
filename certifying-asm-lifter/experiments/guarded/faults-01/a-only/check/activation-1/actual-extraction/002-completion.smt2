; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x6433 (bvand finish (_ bv2 2))))
(let (($x195 (= ?x6433 ?x6433)))
(not $x195))))
(check-sat)
