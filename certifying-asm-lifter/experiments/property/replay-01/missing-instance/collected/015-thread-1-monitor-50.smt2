; benchmark generated from python API
(set-info :status unknown)
(declare-fun |activation-1:\|pd-source-0:p1-open-rmw-3\|| () (_ BitVec 32))
(declare-fun |activation-1:\|pd-source-0:p1-open-rmw-1\|| () (_ BitVec 32))
(declare-fun |activation-1:\|pd-source-0:p1-open-read-2\|| () (_ BitVec 32))
(assert
 (let (($x2526 (= (_ bv2 32) |activation-1:\|pd-source-0:p1-open-read-2\||)))
(let ((?x2659 (ite $x2526 |activation-1:\|pd-source-0:p1-open-rmw-1\|| |activation-1:\|pd-source-0:p1-open-rmw-1\||)))
(let (($x444 (and (distinct ?x2659 |activation-1:\|pd-source-0:p1-open-rmw-3\||) true)))
(let (($x1916 (and (distinct |activation-1:\|pd-source-0:p1-open-rmw-1\|| |activation-1:\|pd-source-0:p1-open-rmw-3\||) true)))
(let (($x1546 (= $x1916 $x444)))
(not $x1546)))))))
(check-sat)
