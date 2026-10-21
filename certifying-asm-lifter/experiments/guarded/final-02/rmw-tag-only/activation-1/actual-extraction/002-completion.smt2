; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x5681 (bvand finish (_ bv2 2))))
(let (($x79 (= ?x5681 ?x5681)))
(not $x79))))
(check-sat)
