; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x6719 (bvand finish (_ bv2 2))))
(let (($x2249 (= ?x6719 ?x6719)))
(not $x2249))))
(check-sat)
