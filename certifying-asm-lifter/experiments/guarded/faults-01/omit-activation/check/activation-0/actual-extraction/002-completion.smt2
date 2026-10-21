; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x6527 (bvand finish (_ bv2 2))))
(let (($x146 (= ?x6527 ?x6527)))
(not $x146))))
(check-sat)
