; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x199 (bvand completion (_ bv2 2))))
(let (($x130 (= ?x199 ?x199)))
(not $x130))))
(check-sat)
