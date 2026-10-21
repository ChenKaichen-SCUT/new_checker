; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x508 (bvand completion (_ bv2 2))))
(let (($x421 (= ?x508 ?x508)))
(not $x421))))
(check-sat)
