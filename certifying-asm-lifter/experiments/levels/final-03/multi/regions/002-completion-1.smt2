; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x82 (bvand completion (_ bv2 2))))
(let (($x79 (= ?x82 ?x82)))
(not $x79))))
(check-sat)
