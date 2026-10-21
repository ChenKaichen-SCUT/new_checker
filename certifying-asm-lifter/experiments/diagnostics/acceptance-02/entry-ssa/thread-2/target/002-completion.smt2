; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x160 (bvand completion (_ bv2 2))))
(let (($x176 (= ?x160 ?x160)))
(not $x176))))
(check-sat)
