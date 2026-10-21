; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x483 (bvand completion (_ bv2 2))))
(let (($x145 (= ?x483 ?x483)))
(not $x145))))
(check-sat)
