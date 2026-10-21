; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x77 (bvand completion (_ bv2 2))))
(let (($x76 (= ?x77 ?x77)))
(not $x76))))
(check-sat)
