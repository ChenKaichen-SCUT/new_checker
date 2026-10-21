; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x78 (bvand finish (_ bv2 2))))
(let (($x152 (= ?x78 ?x78)))
(not $x152))))
(check-sat)
