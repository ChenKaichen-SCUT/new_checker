; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x2583 (bvand completion (_ bv2 2))))
(let (($x2659 (= ?x2583 ?x2583)))
(not $x2659))))
(check-sat)
