; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x227 (bvand completion (_ bv2 2))))
(let (($x1194 (= ?x227 ?x227)))
(not $x1194))))
(check-sat)
