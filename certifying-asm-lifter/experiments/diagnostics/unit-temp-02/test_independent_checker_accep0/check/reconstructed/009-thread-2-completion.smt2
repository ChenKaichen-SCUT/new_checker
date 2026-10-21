; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x349 (bvand completion (_ bv2 2))))
(let (($x138 (= ?x349 ?x349)))
(not $x138))))
(check-sat)
