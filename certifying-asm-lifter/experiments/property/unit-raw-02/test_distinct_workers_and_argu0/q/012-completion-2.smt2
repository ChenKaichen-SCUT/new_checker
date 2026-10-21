; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x121 (bvand completion (_ bv2 2))))
(let (($x86 (= ?x121 ?x121)))
(not $x86))))
(check-sat)
