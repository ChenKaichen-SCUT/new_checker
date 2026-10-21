; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x79 (bvand finish (_ bv2 2))))
(let (($x5100 (= ?x79 ?x79)))
(not $x5100))))
(check-sat)
