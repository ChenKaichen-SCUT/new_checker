; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x178 (bvand completion (_ bv2 2))))
(let (($x280 (= ?x178 ?x178)))
(not $x280))))
(check-sat)
