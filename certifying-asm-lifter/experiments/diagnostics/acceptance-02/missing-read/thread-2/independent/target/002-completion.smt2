; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x211 (bvand completion (_ bv2 2))))
(let (($x128 (= ?x211 ?x211)))
(not $x128))))
(check-sat)
