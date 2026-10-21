; benchmark generated from python API
(set-info :status unknown)
(declare-fun |activation-2:\|pd-source-1:p1-open-rmw-1\|| () (_ BitVec 32))
(declare-fun |activation-2:\|pd-source-1:p1-open-read-0\|| () (_ BitVec 32))
(declare-fun |activation-2:\|pd-source-1:p1-open-read-2\|| () (_ BitVec 32))
(declare-fun |activation-2:\|pd-source-1:p1-open-rmw-3\|| () (_ BitVec 32))
(assert
 (let ((?x1425 (bvadd |activation-2:\|pd-source-1:p1-open-read-0\|| |activation-2:\|pd-source-1:p1-open-rmw-1\||)))
(let (($x2976 (= (_ bv2 32) |activation-2:\|pd-source-1:p1-open-read-2\||)))
(let ((?x377 (ite $x2976 ?x1425 |activation-2:\|pd-source-1:p1-open-rmw-1\||)))
(let ((?x1693 (bvadd |activation-2:\|pd-source-1:p1-open-rmw-3\|| |activation-2:\|pd-source-1:p1-open-rmw-1\||)))
(let (($x2557 (= (ite $x2976 (bvadd |activation-2:\|pd-source-1:p1-open-rmw-3\|| ?x1425) ?x1693) (bvadd |activation-2:\|pd-source-1:p1-open-rmw-3\|| ?x377))))
(not $x2557)))))))
(check-sat)
