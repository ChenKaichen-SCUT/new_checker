; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x106 (bvand completion (_ bv2 2))))
(let (($x83 (= ?x106 ?x106)))
(not $x83))))
(check-sat)
