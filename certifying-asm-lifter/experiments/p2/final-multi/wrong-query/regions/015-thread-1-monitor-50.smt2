; benchmark generated from python API
(set-info :status unknown)
(declare-fun |activation-1:\|source-create-0:p1-open-rmw-3\|| () (_ BitVec 32))
(declare-fun |activation-1:\|source-create-0:p1-open-rmw-1\|| () (_ BitVec 32))
(assert
 (let (($x56 (and (distinct |activation-1:\|source-create-0:p1-open-rmw-1\|| |activation-1:\|source-create-0:p1-open-rmw-3\||) true)))
(let (($x46 (= $x56 $x56)))
(not $x46))))
(check-sat)
