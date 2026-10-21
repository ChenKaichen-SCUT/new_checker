; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x5251 (bvand finish (_ bv2 2))))
(let (($x5252 (= ?x5251 ?x5251)))
(not $x5252))))
(check-sat)
