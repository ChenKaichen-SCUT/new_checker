; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x1157 (bvand finish (_ bv2 2))))
(let (($x63 (= ?x1157 ?x1157)))
(not $x63))))
(check-sat)
