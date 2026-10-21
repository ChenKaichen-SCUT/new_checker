; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x24 (bvand completion (_ bv2 2))))
(let (($x25 (= ?x24 ?x24)))
(not $x25))))
(check-sat)
