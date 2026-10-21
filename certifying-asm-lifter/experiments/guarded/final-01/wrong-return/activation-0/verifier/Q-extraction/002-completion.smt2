; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x7187 (bvand finish (_ bv2 2))))
(let (($x5390 (= ?x7187 ?x7187)))
(not $x5390))))
(check-sat)
