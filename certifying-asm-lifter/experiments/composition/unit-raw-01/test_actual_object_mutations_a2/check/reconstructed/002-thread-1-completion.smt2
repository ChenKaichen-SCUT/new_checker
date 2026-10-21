; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x67 (bvand completion (_ bv2 2))))
(let (($x60 (= ?x67 ?x67)))
(not $x60))))
(check-sat)
