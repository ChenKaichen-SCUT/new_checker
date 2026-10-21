; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x22 (bvand finish (_ bv2 2))))
(let (($x5695 (= ?x22 ?x22)))
(not $x5695))))
(check-sat)
