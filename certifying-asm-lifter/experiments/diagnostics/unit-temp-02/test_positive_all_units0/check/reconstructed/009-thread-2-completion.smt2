; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x247 (bvand completion (_ bv2 2))))
(let (($x355 (= ?x247 ?x247)))
(not $x355))))
(check-sat)
