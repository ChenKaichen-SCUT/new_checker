; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x65 (bvand finish (_ bv2 2))))
(let (($x131 (= ?x65 ?x65)))
(not $x131))))
(check-sat)
