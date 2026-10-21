; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x55 (bvand completion (_ bv2 2))))
(let (($x11 (= ?x55 ?x55)))
(not $x11))))
(check-sat)
