; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x41 (bvand completion (_ bv2 2))))
(let (($x40 (= ?x41 ?x41)))
(not $x40))))
(check-sat)
