; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x64 (bvand completion (_ bv2 2))))
(let (($x44 (= ?x64 ?x64)))
(not $x44))))
(check-sat)
