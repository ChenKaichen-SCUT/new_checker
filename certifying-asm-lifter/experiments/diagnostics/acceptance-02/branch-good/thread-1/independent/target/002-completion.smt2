; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x120 (bvand completion (_ bv2 2))))
(let (($x206 (= ?x120 ?x120)))
(not $x206))))
(check-sat)
