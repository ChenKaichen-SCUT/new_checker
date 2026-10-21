; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x70 (bvand finish (_ bv2 2))))
(let (($x7819 (= ?x70 ?x70)))
(not $x7819))))
(check-sat)
