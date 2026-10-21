; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x742 (bvand completion (_ bv2 2))))
(let (($x966 (= ?x742 ?x742)))
(not $x966))))
(check-sat)
