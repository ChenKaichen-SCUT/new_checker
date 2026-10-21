; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x360 (bvand completion (_ bv2 2))))
(let (($x47 (= ?x360 ?x360)))
(not $x47))))
(check-sat)
