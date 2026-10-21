; benchmark generated from python API
(set-info :status unknown)
(declare-fun |activation-1:\|pd-source-0:p1-open-rmw-3\|| () (_ BitVec 32))
(declare-fun |activation-1:\|pd-source-0:p1-open-rmw-1\|| () (_ BitVec 32))
(declare-fun |activation-1:\|pd-source-0:p1-open-read-2\|| () (_ BitVec 32))
(assert
 (let (($x53 (= (_ bv2 32) |activation-1:\|pd-source-0:p1-open-read-2\||)))
(let ((?x55 (ite $x53 |activation-1:\|pd-source-0:p1-open-rmw-1\|| |activation-1:\|pd-source-0:p1-open-rmw-1\||)))
(let (($x56 (and (distinct ?x55 |activation-1:\|pd-source-0:p1-open-rmw-3\||) true)))
(let (($x27 (and (distinct |activation-1:\|pd-source-0:p1-open-rmw-1\|| |activation-1:\|pd-source-0:p1-open-rmw-3\||) true)))
(let (($x28 (= $x27 $x56)))
(not $x28)))))))
(check-sat)
