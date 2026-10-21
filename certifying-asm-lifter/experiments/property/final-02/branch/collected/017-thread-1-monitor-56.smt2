; benchmark generated from python API
(set-info :status unknown)
(declare-fun |activation-1:\|pd-source-0:p1-open-read-2\|| () (_ BitVec 32))
(assert
 (let (($x24 (= (_ bv2 32) |activation-1:\|pd-source-0:p1-open-read-2\||)))
(let ((?x37 (ite $x24 |activation-1:\|pd-source-0:p1-open-read-2\|| |activation-1:\|pd-source-0:p1-open-read-2\||)))
(let (($x38 (and (distinct (_ bv0 32) ?x37) true)))
(let (($x49 (= (and (distinct (_ bv0 32) |activation-1:\|pd-source-0:p1-open-read-2\||) true) $x38)))
(not $x49))))))
(check-sat)
