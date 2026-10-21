; benchmark generated from python API
(set-info :status unknown)
(declare-fun |activation-2:\|pd-source-1:p1-open-rmw-1\|| () (_ BitVec 32))
(declare-fun |activation-2:\|pd-source-1:p1-open-read-0\|| () (_ BitVec 32))
(declare-fun |activation-2:\|pd-source-1:p1-open-read-2\|| () (_ BitVec 32))
(declare-fun |activation-2:\|pd-source-1:p1-open-rmw-3\|| () (_ BitVec 32))
(assert
 (let ((?x419 (bvadd |activation-2:\|pd-source-1:p1-open-read-0\|| |activation-2:\|pd-source-1:p1-open-rmw-1\||)))
(let (($x1763 (= (_ bv2 32) |activation-2:\|pd-source-1:p1-open-read-2\||)))
(let ((?x372 (ite $x1763 ?x419 |activation-2:\|pd-source-1:p1-open-rmw-1\||)))
(let ((?x2524 (bvadd |activation-2:\|pd-source-1:p1-open-rmw-3\|| |activation-2:\|pd-source-1:p1-open-rmw-1\||)))
(let (($x2841 (= (ite $x1763 (bvadd |activation-2:\|pd-source-1:p1-open-rmw-3\|| ?x419) ?x2524) (bvadd |activation-2:\|pd-source-1:p1-open-rmw-3\|| ?x372))))
(not $x2841)))))))
(check-sat)
