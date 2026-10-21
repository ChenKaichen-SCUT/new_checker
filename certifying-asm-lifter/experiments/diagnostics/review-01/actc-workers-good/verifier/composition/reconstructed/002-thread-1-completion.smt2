; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x19 (bvand completion (_ bv2 2))))
(let (($x16 (= ?x19 ?x19)))
(not $x16))))
(check-sat)
