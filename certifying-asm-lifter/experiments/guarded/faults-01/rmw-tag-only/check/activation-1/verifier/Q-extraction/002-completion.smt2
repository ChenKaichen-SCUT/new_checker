; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x5812 (bvand finish (_ bv2 2))))
(let (($x2754 (= ?x5812 ?x5812)))
(not $x2754))))
(check-sat)
