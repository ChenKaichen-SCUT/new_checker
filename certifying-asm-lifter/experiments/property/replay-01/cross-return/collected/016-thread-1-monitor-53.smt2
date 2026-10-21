; benchmark generated from python API
(set-info :status unknown)
(declare-fun |activation-1:\|pd-source-0:p1-open-rmw-3\|| () (_ BitVec 32))
(declare-fun |activation-1:\|pd-source-0:p1-open-rmw-1\|| () (_ BitVec 32))
(assert
 (let (($x1718 (and (distinct (_ bv0 32) |activation-1:\|pd-source-0:p1-open-rmw-3\||) true)))
(let (($x1784 (= (and (distinct (_ bv0 32) |activation-1:\|pd-source-0:p1-open-rmw-1\||) true) $x1718)))
(not $x1784))))
(check-sat)
