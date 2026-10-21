; benchmark generated from python API
(set-info :status unknown)
(declare-fun |activation-1:\|source-create-0:p1-open-rmw-3\|| () (_ BitVec 32))
(declare-fun |activation-1:\|source-create-0:p1-open-rmw-1\|| () (_ BitVec 32))
(assert
 (let (($x61 (and (distinct (_ bv0 32) |activation-1:\|source-create-0:p1-open-rmw-3\||) true)))
(let (($x55 (= (and (distinct (_ bv0 32) |activation-1:\|source-create-0:p1-open-rmw-1\||) true) $x61)))
(not $x55))))
(check-sat)
