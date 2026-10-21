; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x34 (bvand completion (_ bv2 2))))
(let (($x19 (= ?x34 ?x34)))
(not $x19))))
(check-sat)
