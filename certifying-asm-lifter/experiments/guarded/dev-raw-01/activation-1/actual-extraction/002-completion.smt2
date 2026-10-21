; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x54 (bvand finish (_ bv2 2))))
(let (($x25 (= ?x54 ?x54)))
(not $x25))))
(check-sat)
