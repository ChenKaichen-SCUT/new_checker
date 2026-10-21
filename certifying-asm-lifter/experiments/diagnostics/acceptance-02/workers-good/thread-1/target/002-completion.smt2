; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x23 (bvand completion (_ bv2 2))))
(let (($x65 (= ?x23 ?x23)))
(not $x65))))
(check-sat)
