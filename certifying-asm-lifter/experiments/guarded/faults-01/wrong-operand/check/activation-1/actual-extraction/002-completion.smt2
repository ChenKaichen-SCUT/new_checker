; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x23 (bvand finish (_ bv2 2))))
(let (($x3022 (= ?x23 ?x23)))
(not $x3022))))
(check-sat)
