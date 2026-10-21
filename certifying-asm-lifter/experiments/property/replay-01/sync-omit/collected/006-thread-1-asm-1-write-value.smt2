; benchmark generated from python API
(set-info :status unknown)
(declare-fun |activation-1:\|pd-source-0:p1-open-read-0\|| () (_ BitVec 32))
(declare-fun |activation-1:\|pd-source-0:p1-open-rmw-1\|| () (_ BitVec 32))
(assert
 (let ((?x2906 (bvadd |activation-1:\|pd-source-0:p1-open-rmw-1\|| |activation-1:\|pd-source-0:p1-open-read-0\||)))
(let (($x1074 (= ?x2906 ?x2906)))
(not $x1074))))
(check-sat)
