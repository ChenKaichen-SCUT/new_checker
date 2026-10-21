; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x2526 (bvand completion (_ bv2 2))))
(let (($x412 (= ?x2526 ?x2526)))
(not $x412))))
(check-sat)
