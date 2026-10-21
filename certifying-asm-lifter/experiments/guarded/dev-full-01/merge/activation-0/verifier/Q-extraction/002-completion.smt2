; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x115 (bvand finish (_ bv2 2))))
(let (($x57 (= ?x115 ?x115)))
(not $x57))))
(check-sat)
