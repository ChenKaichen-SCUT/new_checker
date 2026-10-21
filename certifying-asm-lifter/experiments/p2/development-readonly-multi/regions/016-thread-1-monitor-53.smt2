; benchmark generated from python API
(set-info :status unknown)
(declare-fun |activation-1:p1-open-rmw-3| () (_ BitVec 32))
(assert
 (let (($x1188 (and (distinct (_ bv0 32) |activation-1:p1-open-rmw-3|) true)))
(let (($x1189 (= $x1188 $x1188)))
(not $x1189))))
(check-sat)
