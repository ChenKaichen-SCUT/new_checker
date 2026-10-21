; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x65 (bvand finish (_ bv2 2))))
(let (($x10 (= ?x65 ?x65)))
(not $x10))))
(check-sat)
