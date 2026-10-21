; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x4763 (bvand finish (_ bv2 2))))
(let (($x5183 (= ?x4763 ?x4763)))
(not $x5183))))
(check-sat)
