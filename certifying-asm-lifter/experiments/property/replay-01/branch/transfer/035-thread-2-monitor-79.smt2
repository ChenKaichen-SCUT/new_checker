; benchmark generated from python API
(set-info :status unknown)
(declare-fun |activation-2:\|pd-source-1:p1-open-read-2\|| () (_ BitVec 32))
(assert
 (let (($x325 (= (_ bv2 32) |activation-2:\|pd-source-1:p1-open-read-2\||)))
(let ((?x556 (ite $x325 |activation-2:\|pd-source-1:p1-open-read-2\|| |activation-2:\|pd-source-1:p1-open-read-2\||)))
(let (($x510 (= (and (distinct (_ bv0 32) |activation-2:\|pd-source-1:p1-open-read-2\||) true) (and (distinct (_ bv0 32) ?x556) true))))
(not $x510)))))
(check-sat)
