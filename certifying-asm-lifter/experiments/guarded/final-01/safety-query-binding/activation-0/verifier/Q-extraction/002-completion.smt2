; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x1845 (bvand finish (_ bv2 2))))
(let (($x1382 (= ?x1845 ?x1845)))
(not $x1382))))
(check-sat)
