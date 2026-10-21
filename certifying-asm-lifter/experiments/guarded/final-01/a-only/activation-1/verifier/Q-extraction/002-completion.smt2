; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x3471 (bvand finish (_ bv2 2))))
(let (($x41 (= ?x3471 ?x3471)))
(not $x41))))
(check-sat)
