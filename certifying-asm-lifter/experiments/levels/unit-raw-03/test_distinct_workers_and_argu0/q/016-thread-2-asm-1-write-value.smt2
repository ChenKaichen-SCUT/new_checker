; benchmark generated from python API
(set-info :status unknown)
(declare-fun |activation-2:\|source-create-1:p1-open-read-0\|| () (_ BitVec 32))
(declare-fun |activation-2:\|source-create-1:p1-open-rmw-1\|| () (_ BitVec 32))
(assert
 (let ((?x67 (bvadd |activation-2:\|source-create-1:p1-open-rmw-1\|| |activation-2:\|source-create-1:p1-open-read-0\||)))
(let (($x18 (= ?x67 ?x67)))
(not $x18))))
(check-sat)
