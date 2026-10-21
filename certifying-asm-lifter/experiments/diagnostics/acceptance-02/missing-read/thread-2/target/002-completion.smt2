; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x28 (bvand completion (_ bv2 2))))
(let (($x95 (= ?x28 ?x28)))
(not $x95))))
(check-sat)
