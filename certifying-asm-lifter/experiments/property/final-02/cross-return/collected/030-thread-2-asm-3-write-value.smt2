; benchmark generated from python API
(set-info :status unknown)
(declare-fun |activation-2:\|pd-source-1:p1-open-rmw-1\|| () (_ BitVec 32))
(declare-fun |activation-2:\|pd-source-1:p1-open-read-0\|| () (_ BitVec 32))
(declare-fun |activation-2:\|pd-source-1:p1-open-read-2\|| () (_ BitVec 32))
(declare-fun |activation-2:\|pd-source-1:p1-open-rmw-3\|| () (_ BitVec 32))
(assert
 (let ((?x49 (bvadd |activation-2:\|pd-source-1:p1-open-read-0\|| |activation-2:\|pd-source-1:p1-open-rmw-1\||)))
(let (($x97 (= (_ bv2 32) |activation-2:\|pd-source-1:p1-open-read-2\||)))
(let ((?x16 (ite $x97 ?x49 |activation-2:\|pd-source-1:p1-open-rmw-1\||)))
(let ((?x32 (bvadd |activation-2:\|pd-source-1:p1-open-rmw-3\|| |activation-2:\|pd-source-1:p1-open-rmw-1\||)))
(let (($x106 (= (ite $x97 (bvadd |activation-2:\|pd-source-1:p1-open-rmw-3\|| ?x49) ?x32) (bvadd |activation-2:\|pd-source-1:p1-open-rmw-3\|| ?x16))))
(not $x106)))))))
(check-sat)
