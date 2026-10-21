; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x54 (bvand completion (_ bv2 2))))
(let (($x23 (= ?x54 ?x54)))
(not $x23))))
(check-sat)
