; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x3207 (bvand finish (_ bv2 2))))
(let (($x5046 (= ?x3207 ?x3207)))
(not $x5046))))
(check-sat)
