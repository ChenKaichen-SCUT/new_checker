; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x151 (bvand completion (_ bv2 2))))
(let (($x164 (= ?x151 ?x151)))
(not $x164))))
(check-sat)
