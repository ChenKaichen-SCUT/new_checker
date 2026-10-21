; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x362 (bvand completion (_ bv2 2))))
(let (($x9 (= ?x362 ?x362)))
(not $x9))))
(check-sat)
