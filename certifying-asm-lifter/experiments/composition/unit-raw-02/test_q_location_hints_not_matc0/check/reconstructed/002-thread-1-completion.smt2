; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x68 (bvand completion (_ bv2 2))))
(let (($x56 (= ?x68 ?x68)))
(not $x56))))
(check-sat)
