; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x8747 (bvand finish (_ bv2 2))))
(let (($x7137 (= ?x8747 ?x8747)))
(not $x7137))))
(check-sat)
