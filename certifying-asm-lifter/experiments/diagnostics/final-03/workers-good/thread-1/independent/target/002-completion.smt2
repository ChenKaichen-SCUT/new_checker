; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x45 (bvand completion (_ bv2 2))))
(let (($x21 (= ?x45 ?x45)))
(not $x21))))
(check-sat)
