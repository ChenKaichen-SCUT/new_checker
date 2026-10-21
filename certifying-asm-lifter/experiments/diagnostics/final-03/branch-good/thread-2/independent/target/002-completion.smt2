; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x284 (bvand completion (_ bv2 2))))
(let (($x480 (= ?x284 ?x284)))
(not $x480))))
(check-sat)
