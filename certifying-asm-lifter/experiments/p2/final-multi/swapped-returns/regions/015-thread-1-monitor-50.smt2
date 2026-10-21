; benchmark generated from python API
(set-info :status unknown)
(declare-fun |activation-1:\|source-create-0:p1-open-rmw-3\|| () (_ BitVec 32))
(declare-fun |activation-1:\|source-create-0:p1-open-rmw-1\|| () (_ BitVec 32))
(assert
 (let (($x22 (and (distinct |activation-1:\|source-create-0:p1-open-rmw-1\|| |activation-1:\|source-create-0:p1-open-rmw-3\||) true)))
(let (($x57 (and (distinct |activation-1:\|source-create-0:p1-open-rmw-3\|| |activation-1:\|source-create-0:p1-open-rmw-1\||) true)))
(let (($x60 (= $x57 $x22)))
(not $x60)))))
(check-sat)
