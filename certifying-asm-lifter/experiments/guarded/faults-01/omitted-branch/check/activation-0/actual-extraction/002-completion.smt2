; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x5416 (bvand finish (_ bv2 2))))
(let (($x99 (= ?x5416 ?x5416)))
(not $x99))))
(check-sat)
