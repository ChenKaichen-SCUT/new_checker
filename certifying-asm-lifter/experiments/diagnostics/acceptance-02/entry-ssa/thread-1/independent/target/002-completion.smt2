; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x194 (bvand completion (_ bv2 2))))
(let (($x200 (= ?x194 ?x194)))
(not $x200))))
(check-sat)
