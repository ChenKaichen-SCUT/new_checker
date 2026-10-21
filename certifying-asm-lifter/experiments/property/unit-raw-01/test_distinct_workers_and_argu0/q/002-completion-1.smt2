; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x20 (bvand completion (_ bv2 2))))
(let (($x43 (= ?x20 ?x20)))
(not $x43))))
(check-sat)
