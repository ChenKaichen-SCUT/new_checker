; benchmark generated from python API
(set-info :status unknown)
(declare-fun |activation-1:p1-open-rmw-3| () (_ BitVec 32))
(assert
 (let (($x53 (and (distinct (_ bv0 32) |activation-1:p1-open-rmw-3|) true)))
(let (($x30 (= $x53 $x53)))
(not $x30))))
(check-sat)
