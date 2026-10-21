; benchmark generated from python API
(set-info :status unknown)
(declare-fun |activation-1:\|source-create-0:p1-open-read-0\|| () (_ BitVec 32))
(declare-fun |activation-1:\|source-create-0:p1-open-rmw-1\|| () (_ BitVec 32))
(assert
 (let ((?x61 (bvadd |activation-1:\|source-create-0:p1-open-rmw-1\|| |activation-1:\|source-create-0:p1-open-read-0\||)))
(let (($x60 (= ?x61 ?x61)))
(not $x60))))
(check-sat)
