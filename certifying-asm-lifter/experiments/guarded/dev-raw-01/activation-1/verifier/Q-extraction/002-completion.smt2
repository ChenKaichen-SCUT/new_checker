; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x43 (bvand finish (_ bv2 2))))
(let (($x12 (= ?x43 ?x43)))
(not $x12))))
(check-sat)
