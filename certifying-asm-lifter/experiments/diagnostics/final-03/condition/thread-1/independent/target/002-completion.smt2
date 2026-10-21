; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x9 (bvand completion (_ bv2 2))))
(let (($x135 (= ?x9 ?x9)))
(not $x135))))
(check-sat)
