; benchmark generated from python API
(set-info :status unknown)
(declare-fun |activation-1:\|source-create-0:p1-open-rmw-1\|| () (_ BitVec 32))
(declare-fun |activation-1:\|source-create-0:p1-open-rmw-3\|| () (_ BitVec 32))
(assert
 (let ((?x59 (bvadd |activation-1:\|source-create-0:p1-open-rmw-3\|| |activation-1:\|source-create-0:p1-open-rmw-1\||)))
(let (($x41 (= ?x59 ?x59)))
(not $x41))))
(check-sat)
