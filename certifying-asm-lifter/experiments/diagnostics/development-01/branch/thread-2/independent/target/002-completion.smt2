; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x115 (bvand completion (_ bv2 2))))
(let (($x189 (= ?x115 ?x115)))
(not $x189))))
(check-sat)
