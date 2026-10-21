; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x571 (bvand completion (_ bv2 2))))
(let (($x728 (= ?x571 ?x571)))
(not $x728))))
(check-sat)
