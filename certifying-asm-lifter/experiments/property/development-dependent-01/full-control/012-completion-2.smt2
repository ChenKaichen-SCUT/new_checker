; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x51 (bvand completion (_ bv2 2))))
(let (($x14 (= ?x51 ?x51)))
(not $x14))))
(check-sat)
