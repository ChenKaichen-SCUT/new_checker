; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x9 (bvand completion (_ bv2 2))))
(let (($x235 (= ?x9 ?x9)))
(not $x235))))
(check-sat)
