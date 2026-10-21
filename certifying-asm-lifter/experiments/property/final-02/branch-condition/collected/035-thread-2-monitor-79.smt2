; benchmark generated from python API
(set-info :status unknown)
(declare-fun |activation-2:\|pd-source-1:p1-open-read-2\|| () (_ BitVec 32))
(assert
 (let (($x98 (= (_ bv2 32) |activation-2:\|pd-source-1:p1-open-read-2\||)))
(let ((?x92 (ite $x98 |activation-2:\|pd-source-1:p1-open-read-2\|| |activation-2:\|pd-source-1:p1-open-read-2\||)))
(let (($x18 (and (distinct (_ bv0 32) ?x92) true)))
(let (($x7 (= (and (distinct (_ bv0 32) |activation-2:\|pd-source-1:p1-open-read-2\||) true) $x18)))
(not $x7))))))
(check-sat)
