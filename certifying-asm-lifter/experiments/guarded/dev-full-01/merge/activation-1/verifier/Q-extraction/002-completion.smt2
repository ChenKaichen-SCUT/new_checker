; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x107 (bvand finish (_ bv2 2))))
(let (($x307 (= ?x107 ?x107)))
(not $x307))))
(check-sat)
