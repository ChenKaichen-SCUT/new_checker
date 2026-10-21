; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x347 (bvand completion (_ bv2 2))))
(let (($x44 (= ?x347 ?x347)))
(not $x44))))
(check-sat)
