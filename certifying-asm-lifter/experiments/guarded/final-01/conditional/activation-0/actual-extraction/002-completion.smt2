; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x103 (bvand finish (_ bv2 2))))
(let (($x94 (= ?x103 ?x103)))
(not $x94))))
(check-sat)
