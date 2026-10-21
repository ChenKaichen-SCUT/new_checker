; benchmark generated from python API
(set-info :status unknown)
(declare-fun |activation-1:\|pd-source-0:p1-open-rmw-3\|| () (_ BitVec 32))
(declare-fun |activation-1:\|pd-source-0:p1-open-rmw-1\|| () (_ BitVec 32))
(assert
 (let (($x35 (and (distinct (_ bv0 32) |activation-1:\|pd-source-0:p1-open-rmw-3\||) true)))
(let (($x15 (= (and (distinct (_ bv0 32) |activation-1:\|pd-source-0:p1-open-rmw-1\||) true) $x35)))
(not $x15))))
(check-sat)
