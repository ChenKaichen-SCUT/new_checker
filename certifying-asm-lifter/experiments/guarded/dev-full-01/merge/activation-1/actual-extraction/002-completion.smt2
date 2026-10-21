; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x134 (bvand finish (_ bv2 2))))
(let (($x188 (= ?x134 ?x134)))
(not $x188))))
(check-sat)
