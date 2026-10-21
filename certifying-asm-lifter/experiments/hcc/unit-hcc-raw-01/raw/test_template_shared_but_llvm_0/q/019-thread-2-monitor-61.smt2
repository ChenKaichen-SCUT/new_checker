; benchmark generated from python API
(set-info :status unknown)
(declare-fun |activation-2:\|source-create-1:p1-open-rmw-1\|| () (_ BitVec 32))
(assert
 (let (($x62 (and (distinct (_ bv0 32) |activation-2:\|source-create-1:p1-open-rmw-1\||) true)))
(let (($x32 (= $x62 $x62)))
(not $x32))))
(check-sat)
