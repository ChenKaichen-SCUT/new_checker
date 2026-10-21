; benchmark generated from python API
(set-info :status unknown)
(declare-fun |activation-1:\|pd-source-0:p1-open-read-2\|| () (_ BitVec 32))
(assert
 (let (($x961 (= (_ bv2 32) |activation-1:\|pd-source-0:p1-open-read-2\||)))
(let ((?x966 (ite $x961 |activation-1:\|pd-source-0:p1-open-read-2\|| |activation-1:\|pd-source-0:p1-open-read-2\||)))
(let (($x3054 (and (distinct (_ bv0 32) ?x966) true)))
(let (($x327 (= (and (distinct (_ bv0 32) |activation-1:\|pd-source-0:p1-open-read-2\||) true) $x3054)))
(not $x327))))))
(check-sat)
