; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x703 (bvand completion (_ bv2 2))))
(let (($x573 (= ?x703 ?x703)))
(not $x573))))
(check-sat)
