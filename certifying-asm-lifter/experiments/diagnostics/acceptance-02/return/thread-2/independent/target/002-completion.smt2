; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x150 (bvand completion (_ bv2 2))))
(let (($x191 (= ?x150 ?x150)))
(not $x191))))
(check-sat)
