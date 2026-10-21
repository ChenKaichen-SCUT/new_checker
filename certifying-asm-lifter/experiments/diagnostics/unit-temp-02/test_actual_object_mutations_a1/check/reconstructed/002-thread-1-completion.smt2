; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x37 (bvand completion (_ bv2 2))))
(let (($x160 (= ?x37 ?x37)))
(not $x160))))
(check-sat)
