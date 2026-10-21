; benchmark generated from python API
(set-info :status unknown)
(declare-fun |activation-2:\|pd-source-1:p1-open-read-2\|| () (_ BitVec 32))
(assert
 (let (($x126 (= (_ bv2 32) |activation-2:\|pd-source-1:p1-open-read-2\||)))
(let ((?x113 (ite $x126 |activation-2:\|pd-source-1:p1-open-read-2\|| |activation-2:\|pd-source-1:p1-open-read-2\||)))
(let (($x91 (and (distinct (_ bv0 32) ?x113) true)))
(let (($x100 (= (and (distinct (_ bv0 32) |activation-2:\|pd-source-1:p1-open-read-2\||) true) $x91)))
(not $x100))))))
(check-sat)
