; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x2682 (bvand finish (_ bv2 2))))
(let (($x6522 (= ?x2682 ?x2682)))
(not $x6522))))
(check-sat)
