; benchmark generated from python API
(set-info :status unknown)
(declare-fun |activation-2:\|pd-source-1:p1-open-read-0\|| () (_ BitVec 32))
(declare-fun |activation-2:\|pd-source-1:p1-open-rmw-1\|| () (_ BitVec 32))
(assert
 (let ((?x31 (bvadd |activation-2:\|pd-source-1:p1-open-rmw-1\|| |activation-2:\|pd-source-1:p1-open-read-0\||)))
(let (($x26 (= ?x31 ?x31)))
(not $x26))))
(check-sat)
