; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x3082 (bvand finish (_ bv2 2))))
(let (($x835 (= ?x3082 ?x3082)))
(not $x835))))
(check-sat)
