; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x4404 (bvand finish (_ bv2 2))))
(let (($x5532 (= ?x4404 ?x4404)))
(not $x5532))))
(check-sat)
