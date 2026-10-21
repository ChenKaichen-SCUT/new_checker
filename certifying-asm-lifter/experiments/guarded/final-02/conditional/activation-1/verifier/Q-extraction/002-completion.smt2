; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x3421 (bvand finish (_ bv2 2))))
(let (($x955 (= ?x3421 ?x3421)))
(not $x955))))
(check-sat)
