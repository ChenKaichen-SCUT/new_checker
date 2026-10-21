; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x47 (bvand finish (_ bv2 2))))
(let (($x21 (= ?x47 ?x47)))
(not $x21))))
(check-sat)
