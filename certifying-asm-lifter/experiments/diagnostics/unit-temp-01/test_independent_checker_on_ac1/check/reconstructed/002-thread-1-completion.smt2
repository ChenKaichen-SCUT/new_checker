; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x38 (bvand completion (_ bv2 2))))
(let (($x364 (= ?x38 ?x38)))
(not $x364))))
(check-sat)
