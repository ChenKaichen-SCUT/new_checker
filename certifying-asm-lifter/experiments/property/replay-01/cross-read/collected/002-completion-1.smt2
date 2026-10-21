; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x582 (bvand completion (_ bv2 2))))
(let (($x2514 (= ?x582 ?x582)))
(not $x2514))))
(check-sat)
