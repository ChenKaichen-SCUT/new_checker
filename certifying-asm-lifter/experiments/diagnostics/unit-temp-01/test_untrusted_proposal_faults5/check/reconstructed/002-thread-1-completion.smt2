; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x72 (bvand completion (_ bv2 2))))
(let (($x13 (= ?x72 ?x72)))
(not $x13))))
(check-sat)
