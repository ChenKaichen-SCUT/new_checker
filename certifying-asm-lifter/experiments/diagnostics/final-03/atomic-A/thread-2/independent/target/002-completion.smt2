; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x94 (bvand completion (_ bv2 2))))
(let (($x160 (= ?x94 ?x94)))
(not $x160))))
(check-sat)
