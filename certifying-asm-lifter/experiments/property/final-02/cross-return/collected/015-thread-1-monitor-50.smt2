; benchmark generated from python API
(set-info :status unknown)
(declare-fun |activation-1:\|pd-source-0:p1-open-rmw-3\|| () (_ BitVec 32))
(declare-fun |activation-1:\|pd-source-0:p1-open-rmw-1\|| () (_ BitVec 32))
(declare-fun |activation-1:\|pd-source-0:p1-open-read-2\|| () (_ BitVec 32))
(assert
 (let (($x24 (= (_ bv2 32) |activation-1:\|pd-source-0:p1-open-read-2\||)))
(let ((?x10 (ite $x24 |activation-1:\|pd-source-0:p1-open-rmw-1\|| |activation-1:\|pd-source-0:p1-open-rmw-1\||)))
(let (($x26 (and (distinct ?x10 |activation-1:\|pd-source-0:p1-open-rmw-3\||) true)))
(let (($x50 (and (distinct |activation-1:\|pd-source-0:p1-open-rmw-3\|| |activation-1:\|pd-source-0:p1-open-rmw-1\||) true)))
(let (($x56 (= $x50 $x26)))
(not $x56)))))))
(check-sat)
