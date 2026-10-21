; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x365 (bvand completion (_ bv2 2))))
(let (($x349 (= ?x365 ?x365)))
(not $x349))))
(check-sat)
