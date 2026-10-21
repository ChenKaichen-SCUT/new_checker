; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x29 (bvand finish (_ bv2 2))))
(let (($x31 (= ?x29 ?x29)))
(not $x31))))
(check-sat)
