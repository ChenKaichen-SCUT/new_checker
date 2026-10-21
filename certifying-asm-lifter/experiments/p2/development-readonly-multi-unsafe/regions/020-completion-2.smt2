; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x41 (bvand completion (_ bv2 2))))
(let (($x1737 (= ?x41 ?x41)))
(not $x1737))))
(check-sat)
