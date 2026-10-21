; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x2659 (bvand completion (_ bv2 2))))
(let (($x2961 (= ?x2659 ?x2659)))
(not $x2961))))
(check-sat)
