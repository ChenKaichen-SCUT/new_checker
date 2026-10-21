; benchmark generated from python API
(set-info :status unknown)
(declare-fun |activation-2:\|pd-source-1:p1-open-read-2\|| () (_ BitVec 32))
(assert
 (let (($x1763 (= (_ bv2 32) |activation-2:\|pd-source-1:p1-open-read-2\||)))
(let ((?x723 (ite $x1763 |activation-2:\|pd-source-1:p1-open-read-2\|| |activation-2:\|pd-source-1:p1-open-read-2\||)))
(let (($x1473 (and (distinct (_ bv0 32) ?x723) true)))
(let (($x599 (= (and (distinct (_ bv0 32) |activation-2:\|pd-source-1:p1-open-read-2\||) true) $x1473)))
(not $x599))))))
(check-sat)
