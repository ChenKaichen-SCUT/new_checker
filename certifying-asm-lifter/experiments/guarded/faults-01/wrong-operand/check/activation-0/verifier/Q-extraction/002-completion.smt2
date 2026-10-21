; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x93 (bvand finish (_ bv2 2))))
(let (($x4158 (= ?x93 ?x93)))
(not $x4158))))
(check-sat)
