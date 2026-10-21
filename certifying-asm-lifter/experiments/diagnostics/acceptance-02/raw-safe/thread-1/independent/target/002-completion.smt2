; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x22 (bvand completion (_ bv2 2))))
(let (($x24 (= ?x22 ?x22)))
(not $x24))))
(check-sat)
