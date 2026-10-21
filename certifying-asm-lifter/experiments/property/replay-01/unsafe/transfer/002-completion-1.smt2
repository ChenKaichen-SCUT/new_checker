; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x144 (bvand completion (_ bv2 2))))
(let (($x161 (= ?x144 ?x144)))
(not $x161))))
(check-sat)
