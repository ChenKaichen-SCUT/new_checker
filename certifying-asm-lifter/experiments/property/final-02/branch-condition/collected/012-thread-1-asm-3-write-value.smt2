; benchmark generated from python API
(set-info :status unknown)
(declare-fun |activation-1:\|pd-source-0:p1-open-rmw-1\|| () (_ BitVec 32))
(declare-fun |activation-1:\|pd-source-0:p1-open-read-0\|| () (_ BitVec 32))
(declare-fun |activation-1:\|pd-source-0:p1-open-read-2\|| () (_ BitVec 32))
(declare-fun |activation-1:\|pd-source-0:p1-open-rmw-3\|| () (_ BitVec 32))
(assert
 (let ((?x36 (bvadd |activation-1:\|pd-source-0:p1-open-read-0\|| |activation-1:\|pd-source-0:p1-open-rmw-1\||)))
(let (($x24 (= (_ bv2 32) |activation-1:\|pd-source-0:p1-open-read-2\||)))
(let ((?x12 (ite $x24 ?x36 |activation-1:\|pd-source-0:p1-open-rmw-1\||)))
(let ((?x28 (bvadd |activation-1:\|pd-source-0:p1-open-rmw-3\|| |activation-1:\|pd-source-0:p1-open-rmw-1\||)))
(let (($x86 (= (ite $x24 ?x28 (bvadd |activation-1:\|pd-source-0:p1-open-rmw-3\|| ?x36)) (bvadd |activation-1:\|pd-source-0:p1-open-rmw-3\|| ?x12))))
(not $x86)))))))
(check-sat)
