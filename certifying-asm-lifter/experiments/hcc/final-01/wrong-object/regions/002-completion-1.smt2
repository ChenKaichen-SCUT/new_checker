; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x30 (bvand completion (_ bv2 2))))
(let (($x31 (= ?x30 ?x30)))
(not $x31))))
(check-sat)
