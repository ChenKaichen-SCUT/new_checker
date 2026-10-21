; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x153 (bvand completion (_ bv2 2))))
(let (($x12 (= ?x153 ?x153)))
(not $x12))))
(check-sat)
