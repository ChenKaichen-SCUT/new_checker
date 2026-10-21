; benchmark generated from python API
(set-info :status unknown)
(declare-fun |activation-1:\|pd-source-0:p1-open-rmw-1\|| () (_ BitVec 32))
(declare-fun |activation-1:\|pd-source-0:p1-open-read-0\|| () (_ BitVec 32))
(declare-fun |activation-1:\|pd-source-0:p1-open-read-2\|| () (_ BitVec 32))
(declare-fun |activation-1:\|pd-source-0:p1-open-rmw-3\|| () (_ BitVec 32))
(assert
 (let ((?x409 (bvadd |activation-1:\|pd-source-0:p1-open-read-0\|| |activation-1:\|pd-source-0:p1-open-rmw-1\||)))
(let (($x961 (= (_ bv2 32) |activation-1:\|pd-source-0:p1-open-read-2\||)))
(let ((?x527 (ite $x961 ?x409 |activation-1:\|pd-source-0:p1-open-rmw-1\||)))
(let ((?x2698 (bvadd |activation-1:\|pd-source-0:p1-open-rmw-3\|| |activation-1:\|pd-source-0:p1-open-rmw-1\||)))
(let (($x1570 (= (ite $x961 (bvadd |activation-1:\|pd-source-0:p1-open-rmw-3\|| ?x409) ?x2698) (bvadd |activation-1:\|pd-source-0:p1-open-rmw-3\|| ?x527))))
(not $x1570)))))))
(check-sat)
