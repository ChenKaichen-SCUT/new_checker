; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x243 (bvand completion (_ bv2 2))))
(let (($x229 (= ?x243 ?x243)))
(not $x229))))
(check-sat)
