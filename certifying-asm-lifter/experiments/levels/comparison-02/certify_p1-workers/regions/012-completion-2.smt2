; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x36 (bvand completion (_ bv2 2))))
(let (($x54 (= ?x36 ?x36)))
(not $x54))))
(check-sat)
