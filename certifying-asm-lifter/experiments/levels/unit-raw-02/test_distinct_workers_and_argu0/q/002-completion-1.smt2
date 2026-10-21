; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x52 (bvand completion (_ bv2 2))))
(let (($x30 (= ?x52 ?x52)))
(not $x30))))
(check-sat)
