; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x110 (bvand completion (_ bv2 2))))
(let (($x80 (= ?x110 ?x110)))
(not $x80))))
(check-sat)
