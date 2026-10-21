; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x9 (bvand finish (_ bv2 2))))
(let (($x2191 (= ?x9 ?x9)))
(not $x2191))))
(check-sat)
