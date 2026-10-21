; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x58 (bvand completion (_ bv2 2))))
(let (($x360 (= ?x58 ?x58)))
(not $x360))))
(check-sat)
