; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x5199 (bvand finish (_ bv2 2))))
(let (($x2323 (= ?x5199 ?x5199)))
(not $x2323))))
(check-sat)
