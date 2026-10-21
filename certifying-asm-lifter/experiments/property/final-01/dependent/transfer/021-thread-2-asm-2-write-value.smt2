; benchmark generated from python API
(set-info :status unknown)
(declare-fun |activation-2:\|pd-source-1:p1-open-rmw-1\|| () (_ BitVec 32))
(declare-fun |activation-2:\|pd-source-1:p1-open-rmw-2\|| () (_ BitVec 32))
(assert
 (let ((?x78 (bvadd |activation-2:\|pd-source-1:p1-open-rmw-2\|| |activation-2:\|pd-source-1:p1-open-rmw-1\||)))
(let (($x69 (= ?x78 ?x78)))
(not $x69))))
(check-sat)
