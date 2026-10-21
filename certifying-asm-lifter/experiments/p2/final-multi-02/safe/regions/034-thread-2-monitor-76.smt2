; benchmark generated from python API
(set-info :status unknown)
(declare-fun |activation-2:\|source-create-1:p1-open-rmw-3\|| () (_ BitVec 32))
(assert
 (let (($x70 (and (distinct (_ bv0 32) |activation-2:\|source-create-1:p1-open-rmw-3\||) true)))
(let (($x61 (= $x70 $x70)))
(not $x61))))
(check-sat)
