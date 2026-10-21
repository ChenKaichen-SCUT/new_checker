; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x61 (bvand completion (_ bv2 2))))
(let (($x210 (= ?x61 ?x61)))
(not $x210))))
(check-sat)
