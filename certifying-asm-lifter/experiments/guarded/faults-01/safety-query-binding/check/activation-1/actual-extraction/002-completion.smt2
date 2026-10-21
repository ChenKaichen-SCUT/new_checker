; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x301 (bvand finish (_ bv2 2))))
(let (($x6527 (= ?x301 ?x301)))
(not $x6527))))
(check-sat)
