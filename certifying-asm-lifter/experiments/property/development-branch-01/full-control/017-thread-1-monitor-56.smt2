; benchmark generated from python API
(set-info :status unknown)
(declare-fun |activation-1:\|pd-source-0:p1-open-read-2\|| () (_ BitVec 32))
(assert
 (let (($x53 (= (_ bv2 32) |activation-1:\|pd-source-0:p1-open-read-2\||)))
(let ((?x34 (ite $x53 |activation-1:\|pd-source-0:p1-open-read-2\|| |activation-1:\|pd-source-0:p1-open-read-2\||)))
(let (($x26 (and (distinct (_ bv0 32) ?x34) true)))
(let (($x90 (= (and (distinct (_ bv0 32) |activation-1:\|pd-source-0:p1-open-read-2\||) true) $x26)))
(not $x90))))))
(check-sat)
