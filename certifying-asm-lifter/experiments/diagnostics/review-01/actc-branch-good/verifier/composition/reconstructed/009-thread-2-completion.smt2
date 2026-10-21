; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x118 (bvand completion (_ bv2 2))))
(let (($x106 (= ?x118 ?x118)))
(not $x106))))
(check-sat)
