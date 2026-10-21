; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x7317 (bvand finish (_ bv2 2))))
(let (($x1218 (= ?x7317 ?x7317)))
(not $x1218))))
(check-sat)
