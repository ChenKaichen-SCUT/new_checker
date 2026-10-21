; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x81 (bvand completion (_ bv2 2))))
(let (($x447 (= ?x81 ?x81)))
(not $x447))))
(check-sat)
