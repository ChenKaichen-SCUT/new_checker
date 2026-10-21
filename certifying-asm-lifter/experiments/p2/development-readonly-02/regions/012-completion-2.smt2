; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x42 (bvand completion (_ bv2 2))))
(let (($x48 (= ?x42 ?x42)))
(not $x48))))
(check-sat)
