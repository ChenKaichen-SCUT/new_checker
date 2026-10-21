; benchmark generated from python API
(set-info :status unknown)
(declare-fun |activation-2:\|pd-source-1:p1-open-read-2\|| () (_ BitVec 32))
(assert
 (let (($x2976 (= (_ bv2 32) |activation-2:\|pd-source-1:p1-open-read-2\||)))
(let ((?x2538 (ite $x2976 |activation-2:\|pd-source-1:p1-open-read-2\|| |activation-2:\|pd-source-1:p1-open-read-2\||)))
(let (($x1153 (and (distinct (_ bv0 32) ?x2538) true)))
(let (($x972 (= (and (distinct (_ bv0 32) |activation-2:\|pd-source-1:p1-open-read-2\||) true) $x1153)))
(not $x972))))))
(check-sat)
