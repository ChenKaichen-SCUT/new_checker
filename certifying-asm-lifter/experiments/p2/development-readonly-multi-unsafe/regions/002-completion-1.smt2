; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x2136 (bvand completion (_ bv2 2))))
(let (($x1199 (= ?x2136 ?x2136)))
(not $x1199))))
(check-sat)
