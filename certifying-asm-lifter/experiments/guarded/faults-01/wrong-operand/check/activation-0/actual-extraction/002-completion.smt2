; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x7441 (bvand finish (_ bv2 2))))
(let (($x212 (= ?x7441 ?x7441)))
(not $x212))))
(check-sat)
