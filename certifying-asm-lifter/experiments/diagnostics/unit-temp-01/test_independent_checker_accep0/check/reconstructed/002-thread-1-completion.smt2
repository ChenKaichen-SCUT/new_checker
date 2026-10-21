; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x184 (bvand completion (_ bv2 2))))
(let (($x320 (= ?x184 ?x184)))
(not $x320))))
(check-sat)
