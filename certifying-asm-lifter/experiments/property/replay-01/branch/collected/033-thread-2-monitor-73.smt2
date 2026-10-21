; benchmark generated from python API
(set-info :status unknown)
(declare-fun |activation-2:\|pd-source-1:p1-open-rmw-3\|| () (_ BitVec 32))
(declare-fun |activation-2:\|pd-source-1:p1-open-rmw-1\|| () (_ BitVec 32))
(declare-fun |activation-2:\|pd-source-1:p1-open-read-2\|| () (_ BitVec 32))
(assert
 (let (($x325 (= (_ bv2 32) |activation-2:\|pd-source-1:p1-open-read-2\||)))
(let ((?x521 (ite $x325 |activation-2:\|pd-source-1:p1-open-rmw-1\|| |activation-2:\|pd-source-1:p1-open-rmw-1\||)))
(let (($x367 (and (distinct ?x521 |activation-2:\|pd-source-1:p1-open-rmw-3\||) true)))
(let (($x369 (and (distinct |activation-2:\|pd-source-1:p1-open-rmw-1\|| |activation-2:\|pd-source-1:p1-open-rmw-3\||) true)))
(let (($x448 (= $x369 $x367)))
(not $x448)))))))
(check-sat)
