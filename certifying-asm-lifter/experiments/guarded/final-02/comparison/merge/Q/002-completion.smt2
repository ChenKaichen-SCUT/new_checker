; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x1387 (bvand finish (_ bv2 2))))
(let (($x5913 (= ?x1387 ?x1387)))
(not $x5913))))
(check-sat)
