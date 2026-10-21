; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x84 (bvand completion (_ bv2 2))))
(let (($x94 (= ?x84 ?x84)))
(not $x94))))
(check-sat)
