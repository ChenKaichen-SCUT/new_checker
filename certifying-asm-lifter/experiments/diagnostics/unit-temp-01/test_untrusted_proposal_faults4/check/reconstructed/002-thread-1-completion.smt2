; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x246 (bvand completion (_ bv2 2))))
(let (($x68 (= ?x246 ?x246)))
(not $x68))))
(check-sat)
