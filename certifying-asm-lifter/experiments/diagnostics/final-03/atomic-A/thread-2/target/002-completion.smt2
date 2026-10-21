; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x1156 (bvand completion (_ bv2 2))))
(let (($x114 (= ?x1156 ?x1156)))
(not $x114))))
(check-sat)
