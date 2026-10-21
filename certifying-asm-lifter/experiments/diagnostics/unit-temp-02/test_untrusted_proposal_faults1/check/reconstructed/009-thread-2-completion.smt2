; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x339 (bvand completion (_ bv2 2))))
(let (($x85 (= ?x339 ?x339)))
(not $x85))))
(check-sat)
