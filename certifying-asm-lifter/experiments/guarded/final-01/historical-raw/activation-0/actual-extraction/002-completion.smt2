; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x2857 (bvand finish (_ bv2 2))))
(let (($x8747 (= ?x2857 ?x2857)))
(not $x8747))))
(check-sat)
