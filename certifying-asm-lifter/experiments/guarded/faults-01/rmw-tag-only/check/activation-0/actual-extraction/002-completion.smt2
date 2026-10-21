; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x1935 (bvand finish (_ bv2 2))))
(let (($x3988 (= ?x1935 ?x1935)))
(not $x3988))))
(check-sat)
