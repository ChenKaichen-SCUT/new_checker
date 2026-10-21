; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x25 (bvand completion (_ bv2 2))))
(let (($x10 (= ?x25 ?x25)))
(not $x10))))
(check-sat)
