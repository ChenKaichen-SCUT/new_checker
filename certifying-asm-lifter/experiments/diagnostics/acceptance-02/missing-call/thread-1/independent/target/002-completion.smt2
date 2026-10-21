; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x204 (bvand completion (_ bv2 2))))
(let (($x199 (= ?x204 ?x204)))
(not $x199))))
(check-sat)
