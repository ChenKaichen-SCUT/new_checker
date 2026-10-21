; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x10 (bvand completion (_ bv2 2))))
(let (($x64 (= ?x10 ?x10)))
(not $x64))))
(check-sat)
