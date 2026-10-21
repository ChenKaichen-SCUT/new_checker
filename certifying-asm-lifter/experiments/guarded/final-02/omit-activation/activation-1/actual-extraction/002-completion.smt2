; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x3631 (bvand finish (_ bv2 2))))
(let (($x138 (= ?x3631 ?x3631)))
(not $x138))))
(check-sat)
