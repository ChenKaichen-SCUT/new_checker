; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x131 (bvand completion (_ bv2 2))))
(let (($x190 (= ?x131 ?x131)))
(not $x190))))
(check-sat)
