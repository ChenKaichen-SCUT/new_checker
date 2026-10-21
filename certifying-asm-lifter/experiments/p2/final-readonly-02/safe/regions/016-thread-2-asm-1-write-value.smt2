; benchmark generated from python API
(set-info :status unknown)
(declare-fun |activation-2:\|source-create-1:p1-open-read-0\|| () (_ BitVec 32))
(declare-fun |activation-2:\|source-create-1:p1-open-rmw-1\|| () (_ BitVec 32))
(assert
 (let ((?x17 (bvadd |activation-2:\|source-create-1:p1-open-rmw-1\|| |activation-2:\|source-create-1:p1-open-read-0\||)))
(let (($x53 (= ?x17 ?x17)))
(not $x53))))
(check-sat)
