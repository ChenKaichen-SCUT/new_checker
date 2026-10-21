; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x119 (bvand completion (_ bv2 2))))
(let (($x89 (= ?x119 ?x119)))
(not $x89))))
(check-sat)
