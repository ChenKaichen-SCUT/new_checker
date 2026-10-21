; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x156 (bvand finish (_ bv2 2))))
(let (($x123 (= ?x156 ?x156)))
(not $x123))))
(check-sat)
