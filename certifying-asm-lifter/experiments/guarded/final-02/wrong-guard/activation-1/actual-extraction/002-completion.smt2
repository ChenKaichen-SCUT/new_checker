; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x8119 (bvand finish (_ bv2 2))))
(let (($x5927 (= ?x8119 ?x8119)))
(not $x5927))))
(check-sat)
