; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x85 (bvand completion (_ bv2 2))))
(let (($x18 (= ?x85 ?x85)))
(not $x18))))
(check-sat)
