; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x6065 (bvand finish (_ bv2 2))))
(let (($x7174 (= ?x6065 ?x6065)))
(not $x7174))))
(check-sat)
