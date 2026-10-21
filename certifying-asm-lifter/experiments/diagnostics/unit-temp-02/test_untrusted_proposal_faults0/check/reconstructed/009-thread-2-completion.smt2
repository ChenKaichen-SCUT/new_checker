; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x340 (bvand completion (_ bv2 2))))
(let (($x84 (= ?x340 ?x340)))
(not $x84))))
(check-sat)
