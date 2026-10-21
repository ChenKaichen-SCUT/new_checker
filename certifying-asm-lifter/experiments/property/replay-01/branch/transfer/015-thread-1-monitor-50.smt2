; benchmark generated from python API
(set-info :status unknown)
(declare-fun |activation-1:\|pd-source-0:p1-open-rmw-3\|| () (_ BitVec 32))
(declare-fun |activation-1:\|pd-source-0:p1-open-rmw-1\|| () (_ BitVec 32))
(declare-fun |activation-1:\|pd-source-0:p1-open-read-2\|| () (_ BitVec 32))
(assert
 (let (($x515 (= (_ bv2 32) |activation-1:\|pd-source-0:p1-open-read-2\||)))
(let ((?x16 (ite $x515 |activation-1:\|pd-source-0:p1-open-rmw-1\|| |activation-1:\|pd-source-0:p1-open-rmw-1\||)))
(let (($x442 (and (distinct |activation-1:\|pd-source-0:p1-open-rmw-1\|| |activation-1:\|pd-source-0:p1-open-rmw-3\||) true)))
(let (($x76 (= $x442 (and (distinct ?x16 |activation-1:\|pd-source-0:p1-open-rmw-3\||) true))))
(not $x76))))))
(check-sat)
