; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x136 (bvand completion (_ bv2 2))))
(let (($x62 (= ?x136 ?x136)))
(not $x62))))
(check-sat)
