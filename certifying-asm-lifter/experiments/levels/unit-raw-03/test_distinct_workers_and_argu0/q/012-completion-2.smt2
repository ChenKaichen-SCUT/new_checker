; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x49 (bvand completion (_ bv2 2))))
(let (($x27 (= ?x49 ?x49)))
(not $x27))))
(check-sat)
