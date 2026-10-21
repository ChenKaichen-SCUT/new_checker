; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x1057 (bvand finish (_ bv2 2))))
(let (($x5033 (= ?x1057 ?x1057)))
(not $x5033))))
(check-sat)
