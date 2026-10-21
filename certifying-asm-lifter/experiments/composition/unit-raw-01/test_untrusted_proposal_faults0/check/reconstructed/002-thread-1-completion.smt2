; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x7 (bvand completion (_ bv2 2))))
(let (($x105 (= ?x7 ?x7)))
(not $x105))))
(check-sat)
