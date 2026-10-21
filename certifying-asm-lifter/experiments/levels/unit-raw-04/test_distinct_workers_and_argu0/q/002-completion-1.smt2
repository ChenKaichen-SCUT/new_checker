; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x44 (bvand completion (_ bv2 2))))
(let (($x9 (= ?x44 ?x44)))
(not $x9))))
(check-sat)
