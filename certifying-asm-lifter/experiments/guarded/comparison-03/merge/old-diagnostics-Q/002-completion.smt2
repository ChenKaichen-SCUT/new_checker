; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x73 (bvand completion (_ bv2 2))))
(let (($x70 (= ?x73 ?x73)))
(not $x70))))
(check-sat)
