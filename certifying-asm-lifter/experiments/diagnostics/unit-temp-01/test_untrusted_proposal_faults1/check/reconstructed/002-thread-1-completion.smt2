; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x177 (bvand completion (_ bv2 2))))
(let (($x184 (= ?x177 ?x177)))
(not $x184))))
(check-sat)
