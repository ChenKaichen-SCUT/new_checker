; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x89 (bvand completion (_ bv2 2))))
(let (($x91 (= ?x89 ?x89)))
(not $x91))))
(check-sat)
