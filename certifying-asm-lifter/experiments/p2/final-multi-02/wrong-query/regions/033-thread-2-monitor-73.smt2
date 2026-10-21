; benchmark generated from python API
(set-info :status unknown)
(declare-fun |activation-2:\|source-create-1:p1-open-rmw-3\|| () (_ BitVec 32))
(declare-fun |activation-2:\|source-create-1:p1-open-rmw-1\|| () (_ BitVec 32))
(assert
 (let (($x75 (and (distinct |activation-2:\|source-create-1:p1-open-rmw-1\|| |activation-2:\|source-create-1:p1-open-rmw-3\||) true)))
(let (($x56 (= $x75 $x75)))
(not $x56))))
(check-sat)
