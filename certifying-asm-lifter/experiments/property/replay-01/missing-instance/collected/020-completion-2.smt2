; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x740 (bvand completion (_ bv2 2))))
(let (($x923 (= ?x740 ?x740)))
(not $x923))))
(check-sat)
