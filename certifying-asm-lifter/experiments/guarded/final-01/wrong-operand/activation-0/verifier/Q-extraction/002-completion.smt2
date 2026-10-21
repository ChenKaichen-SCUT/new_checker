; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x3694 (bvand finish (_ bv2 2))))
(let (($x7388 (= ?x3694 ?x3694)))
(not $x7388))))
(check-sat)
