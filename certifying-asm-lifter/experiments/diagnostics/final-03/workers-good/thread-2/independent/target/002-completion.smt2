; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x57 (bvand completion (_ bv2 2))))
(let (($x120 (= ?x57 ?x57)))
(not $x120))))
(check-sat)
