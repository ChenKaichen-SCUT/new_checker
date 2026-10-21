; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x75 (bvand finish (_ bv2 2))))
(let (($x2584 (= ?x75 ?x75)))
(not $x2584))))
(check-sat)
