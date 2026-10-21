; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x79 (bvand completion (_ bv2 2))))
(let (($x184 (= ?x79 ?x79)))
(not $x184))))
(check-sat)
