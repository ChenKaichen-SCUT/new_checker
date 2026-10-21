; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x270 (bvand completion (_ bv2 2))))
(let (($x122 (= ?x270 ?x270)))
(not $x122))))
(check-sat)
