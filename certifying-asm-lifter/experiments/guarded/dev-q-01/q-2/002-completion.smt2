; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x92 (bvand finish (_ bv2 2))))
(let (($x107 (= ?x92 ?x92)))
(not $x107))))
(check-sat)
