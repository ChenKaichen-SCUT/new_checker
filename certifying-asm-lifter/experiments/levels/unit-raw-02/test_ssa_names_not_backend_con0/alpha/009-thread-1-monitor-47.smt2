; benchmark generated from python API
(set-info :status unknown)
(declare-fun |activation-1:\|source-create-0:p1-open-rmw-1\|| () (_ BitVec 32))
(assert
 (let (($x6 (and (distinct (_ bv0 32) |activation-1:\|source-create-0:p1-open-rmw-1\||) true)))
(let (($x13 (= $x6 $x6)))
(not $x13))))
(check-sat)
