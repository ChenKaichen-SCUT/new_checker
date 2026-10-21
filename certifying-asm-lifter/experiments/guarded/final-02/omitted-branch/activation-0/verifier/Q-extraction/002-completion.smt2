; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x571 (bvand finish (_ bv2 2))))
(let (($x5083 (= ?x571 ?x571)))
(not $x5083))))
(check-sat)
