; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x103 (bvand completion (_ bv2 2))))
(let (($x88 (= ?x103 ?x103)))
(not $x88))))
(check-sat)
