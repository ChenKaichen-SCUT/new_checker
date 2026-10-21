; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x7445 (bvand finish (_ bv2 2))))
(let (($x137 (= ?x7445 ?x7445)))
(not $x137))))
(check-sat)
