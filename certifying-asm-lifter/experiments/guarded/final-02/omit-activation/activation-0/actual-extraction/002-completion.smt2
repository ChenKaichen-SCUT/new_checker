; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x3645 (bvand finish (_ bv2 2))))
(let (($x1890 (= ?x3645 ?x3645)))
(not $x1890))))
(check-sat)
