; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x8743 (bvand finish (_ bv2 2))))
(let (($x8725 (= ?x8743 ?x8743)))
(not $x8725))))
(check-sat)
