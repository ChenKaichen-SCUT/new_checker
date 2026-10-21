; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x31 (bvand completion (_ bv2 2))))
(let (($x13 (= ?x31 ?x31)))
(not $x13))))
(check-sat)
