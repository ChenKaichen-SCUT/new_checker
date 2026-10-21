; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x359 (bvand completion (_ bv2 2))))
(let (($x355 (= ?x359 ?x359)))
(not $x355))))
(check-sat)
