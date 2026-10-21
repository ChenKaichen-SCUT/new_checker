; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x27 (bvand completion (_ bv2 2))))
(let (($x133 (= ?x27 ?x27)))
(not $x133))))
(check-sat)
