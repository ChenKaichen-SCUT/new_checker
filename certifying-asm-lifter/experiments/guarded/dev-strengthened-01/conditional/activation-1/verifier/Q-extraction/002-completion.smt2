; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x7 (bvand finish (_ bv2 2))))
(let (($x24 (= ?x7 ?x7)))
(not $x24))))
(check-sat)
