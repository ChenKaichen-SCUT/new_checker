; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x18 (bvand completion (_ bv2 2))))
(let (($x23 (= ?x18 ?x18)))
(not $x23))))
(check-sat)
