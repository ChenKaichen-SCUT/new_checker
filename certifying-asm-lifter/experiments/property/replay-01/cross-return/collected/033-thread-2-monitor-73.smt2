; benchmark generated from python API
(set-info :status unknown)
(declare-fun |activation-2:\|pd-source-1:p1-open-rmw-3\|| () (_ BitVec 32))
(declare-fun |activation-2:\|pd-source-1:p1-open-rmw-1\|| () (_ BitVec 32))
(declare-fun |activation-2:\|pd-source-1:p1-open-read-2\|| () (_ BitVec 32))
(assert
 (let (($x1763 (= (_ bv2 32) |activation-2:\|pd-source-1:p1-open-read-2\||)))
(let ((?x1918 (ite $x1763 |activation-2:\|pd-source-1:p1-open-rmw-1\|| |activation-2:\|pd-source-1:p1-open-rmw-1\||)))
(let (($x2970 (and (distinct ?x1918 |activation-2:\|pd-source-1:p1-open-rmw-3\||) true)))
(let (($x416 (and (distinct |activation-2:\|pd-source-1:p1-open-rmw-1\|| |activation-2:\|pd-source-1:p1-open-rmw-3\||) true)))
(let (($x1693 (= $x416 $x2970)))
(not $x1693)))))))
(check-sat)
