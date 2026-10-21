; benchmark generated from python API
(set-info :status unknown)
(declare-fun |activation-1:\|pd-source-0:p1-open-rmw-3\|| () (_ BitVec 32))
(declare-fun |activation-1:\|pd-source-0:p1-open-rmw-1\|| () (_ BitVec 32))
(declare-fun |activation-1:\|pd-source-0:p1-open-read-2\|| () (_ BitVec 32))
(assert
 (let (($x961 (= (_ bv2 32) |activation-1:\|pd-source-0:p1-open-read-2\||)))
(let ((?x580 (ite $x961 |activation-1:\|pd-source-0:p1-open-rmw-1\|| |activation-1:\|pd-source-0:p1-open-rmw-1\||)))
(let (($x381 (and (distinct ?x580 |activation-1:\|pd-source-0:p1-open-rmw-3\||) true)))
(let (($x405 (and (distinct |activation-1:\|pd-source-0:p1-open-rmw-3\|| |activation-1:\|pd-source-0:p1-open-rmw-1\||) true)))
(let (($x734 (= $x405 $x381)))
(not $x734)))))))
(check-sat)
