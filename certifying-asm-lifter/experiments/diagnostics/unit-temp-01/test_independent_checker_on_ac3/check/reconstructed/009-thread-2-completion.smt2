; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x79 (bvand completion (_ bv2 2))))
(let (($x177 (= ?x79 ?x79)))
(not $x177))))
(check-sat)
