; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x50 (bvand completion (_ bv2 2))))
(let (($x42 (= ?x50 ?x50)))
(not $x42))))
(check-sat)
