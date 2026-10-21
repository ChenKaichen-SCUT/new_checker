; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x7579 (bvand finish (_ bv2 2))))
(let (($x173 (= ?x7579 ?x7579)))
(not $x173))))
(check-sat)
