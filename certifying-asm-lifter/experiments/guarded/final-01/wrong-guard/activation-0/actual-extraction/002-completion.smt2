; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x97 (bvand finish (_ bv2 2))))
(let (($x115 (= ?x97 ?x97)))
(not $x115))))
(check-sat)
