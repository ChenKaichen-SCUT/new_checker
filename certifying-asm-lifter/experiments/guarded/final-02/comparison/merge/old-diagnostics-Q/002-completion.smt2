; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x1192 (bvand completion (_ bv2 2))))
(let (($x1552 (= ?x1192 ?x1192)))
(not $x1552))))
(check-sat)
