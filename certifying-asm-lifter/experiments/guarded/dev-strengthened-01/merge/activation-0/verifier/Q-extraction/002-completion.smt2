; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x208 (bvand finish (_ bv2 2))))
(let (($x7207 (= ?x208 ?x208)))
(not $x7207))))
(check-sat)
