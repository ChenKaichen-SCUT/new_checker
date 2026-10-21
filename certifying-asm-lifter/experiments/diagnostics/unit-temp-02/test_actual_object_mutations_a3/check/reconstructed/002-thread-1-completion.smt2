; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x132 (bvand completion (_ bv2 2))))
(let (($x332 (= ?x132 ?x132)))
(not $x332))))
(check-sat)
