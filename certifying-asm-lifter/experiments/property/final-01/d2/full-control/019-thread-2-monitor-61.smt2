; benchmark generated from python API
(set-info :status unknown)
(declare-fun |activation-2:\|pd-source-1:p1-open-rmw-1\|| () (_ BitVec 32))
(assert
 (let (($x69 (and (distinct (_ bv0 32) |activation-2:\|pd-source-1:p1-open-rmw-1\||) true)))
(let (($x72 (= $x69 $x69)))
(not $x72))))
(check-sat)
