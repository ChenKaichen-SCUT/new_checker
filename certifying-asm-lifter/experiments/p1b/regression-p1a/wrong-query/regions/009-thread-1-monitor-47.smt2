; benchmark generated from python API
(set-info :status unknown)
(declare-fun |activation-1:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x28 (and (distinct (_ bv0 32) |activation-1:p1-open-rmw-1|) true)))
(let (($x45 (= $x28 $x28)))
(not $x45))))
(check-sat)
