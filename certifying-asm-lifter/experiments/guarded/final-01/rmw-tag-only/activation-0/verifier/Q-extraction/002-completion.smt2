; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x252 (bvand finish (_ bv2 2))))
(let (($x7829 (= ?x252 ?x252)))
(not $x7829))))
(check-sat)
