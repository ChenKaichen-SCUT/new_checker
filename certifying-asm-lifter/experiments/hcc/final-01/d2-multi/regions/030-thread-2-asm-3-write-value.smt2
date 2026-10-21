; benchmark generated from python API
(set-info :status unknown)
(declare-fun |activation-2:\|source-create-1:p1-open-rmw-1\|| () (_ BitVec 32))
(declare-fun |activation-2:\|source-create-1:p1-open-rmw-3\|| () (_ BitVec 32))
(assert
 (let ((?x61 (bvadd |activation-2:\|source-create-1:p1-open-rmw-3\|| |activation-2:\|source-create-1:p1-open-rmw-1\||)))
(let (($x67 (= ?x61 ?x61)))
(not $x67))))
(check-sat)
