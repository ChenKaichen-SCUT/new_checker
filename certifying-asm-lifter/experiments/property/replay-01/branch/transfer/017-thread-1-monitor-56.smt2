; benchmark generated from python API
(set-info :status unknown)
(declare-fun |activation-1:\|pd-source-0:p1-open-read-2\|| () (_ BitVec 32))
(assert
 (let (($x515 (= (_ bv2 32) |activation-1:\|pd-source-0:p1-open-read-2\||)))
(let ((?x437 (ite $x515 |activation-1:\|pd-source-0:p1-open-read-2\|| |activation-1:\|pd-source-0:p1-open-read-2\||)))
(let (($x146 (= (and (distinct (_ bv0 32) |activation-1:\|pd-source-0:p1-open-read-2\||) true) (and (distinct (_ bv0 32) ?x437) true))))
(not $x146)))))
(check-sat)
