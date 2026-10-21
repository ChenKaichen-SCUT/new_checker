; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x849 (bvand completion (_ bv2 2))))
(let (($x319 (= ?x849 ?x849)))
(not $x319))))
(check-sat)
