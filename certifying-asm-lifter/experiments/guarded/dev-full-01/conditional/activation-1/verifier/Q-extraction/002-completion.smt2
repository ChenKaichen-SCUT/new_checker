; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x204 (bvand finish (_ bv2 2))))
(let (($x2370 (= ?x204 ?x204)))
(not $x2370))))
(check-sat)
