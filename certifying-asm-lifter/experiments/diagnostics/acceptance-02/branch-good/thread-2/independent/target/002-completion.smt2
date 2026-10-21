; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x91 (bvand completion (_ bv2 2))))
(let (($x189 (= ?x91 ?x91)))
(not $x189))))
(check-sat)
