; benchmark generated from python API
(set-info :status unknown)
(declare-fun completion () (_ BitVec 2))
(assert
 (let ((?x97 (bvand completion (_ bv2 2))))
(let (($x169 (= ?x97 ?x97)))
(not $x169))))
(check-sat)
