; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x4142 (bvand finish (_ bv2 2))))
(let (($x3352 (= ?x4142 ?x4142)))
(not $x3352))))
(check-sat)
