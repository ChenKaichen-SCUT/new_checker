; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x2136 (bvand completion (_ bv2 2))))
(let (($x192 (= ?x2136 ?x2136)))
(not $x192))))
(check-sat)
