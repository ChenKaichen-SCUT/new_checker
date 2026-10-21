; benchmark generated from python API
(set-info :status unknown)
(declare-fun |activation-1:\|source-create-0:p1-open-read-0\|| () (_ BitVec 32))
(declare-fun |activation-1:\|source-create-0:p1-open-rmw-1\|| () (_ BitVec 32))
(assert
 (let ((?x10 (bvadd |activation-1:\|source-create-0:p1-open-rmw-1\|| |activation-1:\|source-create-0:p1-open-read-0\||)))
(let (($x52 (= ?x10 ?x10)))
(not $x52))))
(check-sat)
