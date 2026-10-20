; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x17 (bvand completion (_ bv2 2))))
(let (($x49 (= ?x17 ?x17)))
(not $x49))))
(check-sat)
