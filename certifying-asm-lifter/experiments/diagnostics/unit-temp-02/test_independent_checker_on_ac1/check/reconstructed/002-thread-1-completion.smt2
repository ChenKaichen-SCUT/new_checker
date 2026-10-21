; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x57 (bvand completion (_ bv2 2))))
(let (($x297 (= ?x57 ?x57)))
(not $x297))))
(check-sat)
