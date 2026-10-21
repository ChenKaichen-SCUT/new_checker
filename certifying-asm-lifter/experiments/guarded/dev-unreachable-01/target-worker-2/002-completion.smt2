; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x6430 (bvand finish (_ bv2 2))))
(let (($x3565 (= ?x6430 ?x6430)))
(not $x3565))))
(check-sat)
