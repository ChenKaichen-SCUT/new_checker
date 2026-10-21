; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x186 (bvand completion (_ bv2 2))))
(let (($x199 (= ?x186 ?x186)))
(not $x199))))
(check-sat)
