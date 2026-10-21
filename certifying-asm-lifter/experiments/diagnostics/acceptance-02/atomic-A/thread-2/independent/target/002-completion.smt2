; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x176 (bvand completion (_ bv2 2))))
(let (($x105 (= ?x176 ?x176)))
(not $x105))))
(check-sat)
