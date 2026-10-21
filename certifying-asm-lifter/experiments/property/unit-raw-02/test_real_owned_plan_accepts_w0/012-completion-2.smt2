; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x62 (bvand completion (_ bv2 2))))
(let (($x89 (= ?x62 ?x62)))
(not $x89))))
(check-sat)
