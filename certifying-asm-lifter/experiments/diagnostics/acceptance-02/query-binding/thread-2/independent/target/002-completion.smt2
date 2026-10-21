; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x90 (bvand completion (_ bv2 2))))
(let (($x80 (= ?x90 ?x90)))
(not $x80))))
(check-sat)
