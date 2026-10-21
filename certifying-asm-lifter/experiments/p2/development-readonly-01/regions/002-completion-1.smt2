; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x33 (bvand completion (_ bv2 2))))
(let (($x43 (= ?x33 ?x33)))
(not $x43))))
(check-sat)
