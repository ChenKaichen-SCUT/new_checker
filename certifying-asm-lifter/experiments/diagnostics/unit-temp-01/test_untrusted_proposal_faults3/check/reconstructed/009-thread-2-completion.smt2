; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x41 (bvand completion (_ bv2 2))))
(let (($x345 (= ?x41 ?x41)))
(not $x345))))
(check-sat)
