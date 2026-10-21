; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x8856 (bvand finish (_ bv2 2))))
(let (($x8460 (= ?x8856 ?x8856)))
(not $x8460))))
(check-sat)
