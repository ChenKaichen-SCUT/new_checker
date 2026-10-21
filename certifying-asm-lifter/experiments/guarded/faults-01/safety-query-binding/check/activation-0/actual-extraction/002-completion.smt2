; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x5732 (bvand finish (_ bv2 2))))
(let (($x2451 (= ?x5732 ?x5732)))
(not $x2451))))
(check-sat)
