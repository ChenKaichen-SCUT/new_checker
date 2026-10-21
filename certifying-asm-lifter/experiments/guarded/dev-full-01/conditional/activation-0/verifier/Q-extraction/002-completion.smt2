; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x50 (bvand finish (_ bv2 2))))
(let (($x214 (= ?x50 ?x50)))
(not $x214))))
(check-sat)
