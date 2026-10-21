; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x154 (bvand completion (_ bv2 2))))
(let (($x184 (= ?x154 ?x154)))
(not $x184))))
(check-sat)
