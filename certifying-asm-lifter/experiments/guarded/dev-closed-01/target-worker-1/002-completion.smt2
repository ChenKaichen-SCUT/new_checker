; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x36 (bvand finish (_ bv2 2))))
(let (($x6 (= ?x36 ?x36)))
(not $x6))))
(check-sat)
