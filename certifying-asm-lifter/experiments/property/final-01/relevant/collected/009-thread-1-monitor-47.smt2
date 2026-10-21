; benchmark generated from python API
(set-info :status unknown)
(declare-fun |activation-1:\|pd-source-0:p1-open-rmw-1\|| () (_ BitVec 32))
(assert
 (let (($x45 (and (distinct (_ bv0 32) |activation-1:\|pd-source-0:p1-open-rmw-1\||) true)))
(let (($x35 (= $x45 $x45)))
(not $x35))))
(check-sat)
