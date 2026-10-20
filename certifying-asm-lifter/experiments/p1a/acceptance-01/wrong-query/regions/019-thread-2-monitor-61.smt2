; benchmark generated from python API
(set-info :status unknown)
(declare-fun |activation-2:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x55 (and (distinct (_ bv0 32) |activation-2:p1-open-rmw-1|) true)))
(let (($x38 (= $x55 $x55)))
(not $x38))))
(check-sat)
