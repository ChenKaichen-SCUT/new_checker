; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x73 (bvand finish (_ bv2 2))))
(let (($x70 (= ?x73 ?x73)))
(not $x70))))
(check-sat)
