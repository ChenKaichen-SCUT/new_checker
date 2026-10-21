; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x189 (bvand finish (_ bv2 2))))
(let (($x249 (= ?x189 ?x189)))
(not $x249))))
(check-sat)
