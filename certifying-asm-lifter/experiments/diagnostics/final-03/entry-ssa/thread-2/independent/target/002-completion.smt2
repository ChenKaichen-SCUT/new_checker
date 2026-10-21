; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x195 (bvand completion (_ bv2 2))))
(let (($x127 (= ?x195 ?x195)))
(not $x127))))
(check-sat)
