; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x11 (bvand completion (_ bv2 2))))
(let (($x66 (= ?x11 ?x11)))
(not $x66))))
(check-sat)
