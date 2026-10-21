; benchmark generated from python API
(set-info :status unknown)
(declare-fun |activation-2:\|pd-source-1:p1-open-rmw-3\|| () (_ BitVec 32))
(declare-fun |activation-2:\|pd-source-1:p1-open-rmw-1\|| () (_ BitVec 32))
(declare-fun |activation-2:\|pd-source-1:p1-open-read-2\|| () (_ BitVec 32))
(assert
 (let (($x2976 (= (_ bv2 32) |activation-2:\|pd-source-1:p1-open-read-2\||)))
(let ((?x431 (ite $x2976 |activation-2:\|pd-source-1:p1-open-rmw-1\|| |activation-2:\|pd-source-1:p1-open-rmw-1\||)))
(let (($x2683 (and (distinct ?x431 |activation-2:\|pd-source-1:p1-open-rmw-3\||) true)))
(let (($x1690 (and (distinct |activation-2:\|pd-source-1:p1-open-rmw-1\|| |activation-2:\|pd-source-1:p1-open-rmw-3\||) true)))
(let (($x667 (= $x1690 $x2683)))
(not $x667)))))))
(check-sat)
