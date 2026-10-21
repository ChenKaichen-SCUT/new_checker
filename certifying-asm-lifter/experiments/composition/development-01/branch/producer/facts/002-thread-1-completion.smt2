; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x56 (bvand completion (_ bv2 2))))
(let (($x53 (= ?x56 ?x56)))
(not $x53))))
(check-sat)
