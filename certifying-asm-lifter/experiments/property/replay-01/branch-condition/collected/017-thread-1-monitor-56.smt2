; benchmark generated from python API
(set-info :status unknown)
(declare-fun |activation-1:\|pd-source-0:p1-open-read-2\|| () (_ BitVec 32))
(assert
 (let (($x3054 (= (_ bv2 32) |activation-1:\|pd-source-0:p1-open-read-2\||)))
(let ((?x533 (ite $x3054 |activation-1:\|pd-source-0:p1-open-read-2\|| |activation-1:\|pd-source-0:p1-open-read-2\||)))
(let (($x507 (and (distinct (_ bv0 32) ?x533) true)))
(let (($x526 (= (and (distinct (_ bv0 32) |activation-1:\|pd-source-0:p1-open-read-2\||) true) $x507)))
(not $x526))))))
(check-sat)
