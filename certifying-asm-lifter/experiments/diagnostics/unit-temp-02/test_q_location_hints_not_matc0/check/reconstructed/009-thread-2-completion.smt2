; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x332 (bvand completion (_ bv2 2))))
(let (($x299 (= ?x332 ?x332)))
(not $x299))))
(check-sat)
