; benchmark generated from python API
(set-info :status unknown)
(declare-fun |activation-1:\|pd-source-0:p1-open-rmw-1\|| () (_ BitVec 32))
(declare-fun |activation-1:\|pd-source-0:p1-open-read-0\|| () (_ BitVec 32))
(declare-fun |activation-1:\|pd-source-0:p1-open-read-2\|| () (_ BitVec 32))
(declare-fun |activation-1:\|pd-source-0:p1-open-rmw-3\|| () (_ BitVec 32))
(assert
 (let ((?x52 (bvadd |activation-1:\|pd-source-0:p1-open-read-0\|| |activation-1:\|pd-source-0:p1-open-rmw-1\||)))
(let (($x53 (= (_ bv2 32) |activation-1:\|pd-source-0:p1-open-read-2\||)))
(let ((?x33 (bvadd |activation-1:\|pd-source-0:p1-open-rmw-3\|| (ite $x53 ?x52 |activation-1:\|pd-source-0:p1-open-rmw-1\||))))
(let ((?x12 (bvadd |activation-1:\|pd-source-0:p1-open-rmw-3\|| |activation-1:\|pd-source-0:p1-open-rmw-1\||)))
(let (($x32 (= (ite $x53 (bvadd |activation-1:\|pd-source-0:p1-open-rmw-3\|| ?x52) ?x12) ?x33)))
(not $x32)))))))
(check-sat)
