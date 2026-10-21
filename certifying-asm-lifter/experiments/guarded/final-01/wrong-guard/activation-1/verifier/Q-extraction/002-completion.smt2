; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x3421 (bvand finish (_ bv2 2))))
(let (($x6941 (= ?x3421 ?x3421)))
(not $x6941))))
(check-sat)
