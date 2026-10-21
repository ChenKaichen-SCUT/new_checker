; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x6944 (bvand finish (_ bv2 2))))
(let (($x8669 (= ?x6944 ?x6944)))
(not $x8669))))
(check-sat)
