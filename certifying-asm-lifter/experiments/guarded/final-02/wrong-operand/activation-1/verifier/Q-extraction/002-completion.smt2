; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x7628 (bvand finish (_ bv2 2))))
(let (($x8958 (= ?x7628 ?x7628)))
(not $x8958))))
(check-sat)
