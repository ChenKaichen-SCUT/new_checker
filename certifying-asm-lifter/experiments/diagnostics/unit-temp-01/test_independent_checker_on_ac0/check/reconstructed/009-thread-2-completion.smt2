; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x240 (bvand completion (_ bv2 2))))
(let (($x107 (= ?x240 ?x240)))
(not $x107))))
(check-sat)
