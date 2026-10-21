; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x63 (bvand completion (_ bv2 2))))
(let (($x32 (= ?x63 ?x63)))
(not $x32))))
(check-sat)
