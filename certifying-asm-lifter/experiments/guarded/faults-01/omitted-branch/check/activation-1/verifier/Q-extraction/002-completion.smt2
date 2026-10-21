; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x8484 (bvand finish (_ bv2 2))))
(let (($x3988 (= ?x8484 ?x8484)))
(not $x3988))))
(check-sat)
