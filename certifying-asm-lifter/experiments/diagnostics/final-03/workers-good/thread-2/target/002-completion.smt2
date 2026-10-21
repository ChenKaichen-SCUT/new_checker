; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x1146 (bvand completion (_ bv2 2))))
(let (($x113 (= ?x1146 ?x1146)))
(not $x113))))
(check-sat)
