; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x3706 (bvand finish (_ bv2 2))))
(let (($x8710 (= ?x3706 ?x3706)))
(not $x8710))))
(check-sat)
