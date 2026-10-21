; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x8594 (bvand finish (_ bv2 2))))
(let (($x2510 (= ?x8594 ?x8594)))
(not $x2510))))
(check-sat)
