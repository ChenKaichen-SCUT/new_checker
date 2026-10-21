; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x6458 (bvand finish (_ bv2 2))))
(let (($x3237 (= ?x6458 ?x6458)))
(not $x3237))))
(check-sat)
