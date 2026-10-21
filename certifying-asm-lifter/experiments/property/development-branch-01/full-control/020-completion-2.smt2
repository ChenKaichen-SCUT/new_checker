; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x46 (bvand completion (_ bv2 2))))
(let (($x47 (= ?x46 ?x46)))
(not $x47))))
(check-sat)
