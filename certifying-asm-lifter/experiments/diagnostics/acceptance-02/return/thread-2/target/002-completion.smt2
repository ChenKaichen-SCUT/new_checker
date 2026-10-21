; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x116 (bvand completion (_ bv2 2))))
(let (($x572 (= ?x116 ?x116)))
(not $x572))))
(check-sat)
