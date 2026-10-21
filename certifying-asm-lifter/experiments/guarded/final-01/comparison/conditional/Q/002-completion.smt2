; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x2685 (bvand finish (_ bv2 2))))
(let (($x383 (= ?x2685 ?x2685)))
(not $x383))))
(check-sat)
