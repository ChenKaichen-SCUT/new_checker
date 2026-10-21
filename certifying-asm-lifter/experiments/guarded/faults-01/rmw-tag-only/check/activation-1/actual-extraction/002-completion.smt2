; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x8248 (bvand finish (_ bv2 2))))
(let (($x383 (= ?x8248 ?x8248)))
(not $x383))))
(check-sat)
