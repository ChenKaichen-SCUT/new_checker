; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x63 (bvand finish (_ bv2 2))))
(let (($x37 (= ?x63 ?x63)))
(not $x37))))
(check-sat)
