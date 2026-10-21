; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x93 (bvand completion (_ bv2 2))))
(let (($x108 (= ?x93 ?x93)))
(not $x108))))
(check-sat)
