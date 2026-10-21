; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x146 (bvand completion (_ bv2 2))))
(let (($x44 (= ?x146 ?x146)))
(not $x44))))
(check-sat)
