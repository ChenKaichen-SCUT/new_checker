; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x105 (bvand completion (_ bv2 2))))
(let (($x45 (= ?x105 ?x105)))
(not $x45))))
(check-sat)
