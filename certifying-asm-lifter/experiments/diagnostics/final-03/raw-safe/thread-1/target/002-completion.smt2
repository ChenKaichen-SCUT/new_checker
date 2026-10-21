; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x40 (bvand completion (_ bv2 2))))
(let (($x37 (= ?x40 ?x40)))
(not $x37))))
(check-sat)
