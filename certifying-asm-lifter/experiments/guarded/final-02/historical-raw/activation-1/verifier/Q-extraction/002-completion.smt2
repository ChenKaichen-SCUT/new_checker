; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x31 (bvand finish (_ bv2 2))))
(let (($x4880 (= ?x31 ?x31)))
(not $x4880))))
(check-sat)
