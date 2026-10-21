; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x107 (bvand finish (_ bv2 2))))
(let (($x2844 (= ?x107 ?x107)))
(not $x2844))))
(check-sat)
