; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x6764 (bvand finish (_ bv2 2))))
(let (($x8725 (= ?x6764 ?x6764)))
(not $x8725))))
(check-sat)
