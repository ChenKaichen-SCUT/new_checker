; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x39 (bvand completion (_ bv2 2))))
(let (($x58 (= ?x39 ?x39)))
(not $x58))))
(check-sat)
