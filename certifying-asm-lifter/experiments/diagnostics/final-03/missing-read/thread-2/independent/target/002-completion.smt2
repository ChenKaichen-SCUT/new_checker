; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x226 (bvand completion (_ bv2 2))))
(let (($x147 (= ?x226 ?x226)))
(not $x147))))
(check-sat)
