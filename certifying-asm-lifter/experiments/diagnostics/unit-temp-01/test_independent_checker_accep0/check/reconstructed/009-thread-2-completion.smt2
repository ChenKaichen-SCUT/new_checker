; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x175 (bvand completion (_ bv2 2))))
(let (($x66 (= ?x175 ?x175)))
(not $x66))))
(check-sat)
