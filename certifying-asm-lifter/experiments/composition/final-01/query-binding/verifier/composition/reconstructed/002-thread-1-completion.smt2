; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x26 (bvand completion (_ bv2 2))))
(let (($x34 (= ?x26 ?x26)))
(not $x34))))
(check-sat)
