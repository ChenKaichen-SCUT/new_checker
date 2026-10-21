; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x279 (bvand completion (_ bv2 2))))
(let (($x196 (= ?x279 ?x279)))
(not $x196))))
(check-sat)
