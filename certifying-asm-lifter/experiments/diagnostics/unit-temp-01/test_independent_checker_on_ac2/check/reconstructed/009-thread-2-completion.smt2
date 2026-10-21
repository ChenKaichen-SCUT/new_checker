; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x302 (bvand completion (_ bv2 2))))
(let (($x59 (= ?x302 ?x302)))
(not $x59))))
(check-sat)
