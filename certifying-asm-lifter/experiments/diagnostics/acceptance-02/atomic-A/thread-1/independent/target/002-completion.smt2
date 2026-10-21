; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x99 (bvand completion (_ bv2 2))))
(let (($x41 (= ?x99 ?x99)))
(not $x41))))
(check-sat)
