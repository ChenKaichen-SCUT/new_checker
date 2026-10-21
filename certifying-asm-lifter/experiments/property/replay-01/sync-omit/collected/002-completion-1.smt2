; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x1825 (bvand completion (_ bv2 2))))
(let (($x749 (= ?x1825 ?x1825)))
(not $x749))))
(check-sat)
