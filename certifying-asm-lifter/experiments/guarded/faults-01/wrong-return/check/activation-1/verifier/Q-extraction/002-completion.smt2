; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x51 (bvand finish (_ bv2 2))))
(let (($x8004 (= ?x51 ?x51)))
(not $x8004))))
(check-sat)
