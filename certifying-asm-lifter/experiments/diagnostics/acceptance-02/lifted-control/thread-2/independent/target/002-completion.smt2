; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x43 (bvand completion (_ bv2 2))))
(let (($x50 (= ?x43 ?x43)))
(not $x50))))
(check-sat)
