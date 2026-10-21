; benchmark generated from python API
(set-info :status unknown)
(declare-fun |activation-1:\|source-create-0:p1-open-rmw-3\|| () (_ BitVec 32))
(assert
 (let (($x61 (and (distinct (_ bv0 32) |activation-1:\|source-create-0:p1-open-rmw-3\||) true)))
(let (($x65 (= (not $x61) $x61)))
(not $x65))))
(check-sat)
