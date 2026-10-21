; benchmark generated from python API
(set-info :status unknown)
(declare-fun |activation-2:\|pd-source-1:p1-open-rmw-3\|| () (_ BitVec 32))
(declare-fun |activation-2:\|pd-source-1:p1-open-rmw-1\|| () (_ BitVec 32))
(declare-fun |activation-2:\|pd-source-1:p1-open-read-2\|| () (_ BitVec 32))
(assert
 (let (($x97 (= (_ bv2 32) |activation-2:\|pd-source-1:p1-open-read-2\||)))
(let ((?x125 (ite $x97 |activation-2:\|pd-source-1:p1-open-rmw-1\|| |activation-2:\|pd-source-1:p1-open-rmw-1\||)))
(let (($x90 (and (distinct ?x125 |activation-2:\|pd-source-1:p1-open-rmw-3\||) true)))
(let (($x105 (and (distinct |activation-2:\|pd-source-1:p1-open-rmw-1\|| |activation-2:\|pd-source-1:p1-open-rmw-3\||) true)))
(let (($x42 (= $x105 $x90)))
(not $x42)))))))
(check-sat)
