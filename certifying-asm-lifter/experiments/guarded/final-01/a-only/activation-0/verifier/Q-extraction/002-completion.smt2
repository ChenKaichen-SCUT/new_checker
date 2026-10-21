; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x1992 (bvand finish (_ bv2 2))))
(let (($x4806 (= ?x1992 ?x1992)))
(not $x4806))))
(check-sat)
