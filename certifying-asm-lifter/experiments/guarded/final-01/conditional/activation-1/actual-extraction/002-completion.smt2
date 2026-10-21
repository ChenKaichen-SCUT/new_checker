; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x4528 (bvand finish (_ bv2 2))))
(let (($x48 (= ?x4528 ?x4528)))
(not $x48))))
(check-sat)
