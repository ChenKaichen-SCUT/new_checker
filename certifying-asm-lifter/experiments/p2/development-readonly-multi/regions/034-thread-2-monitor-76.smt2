; benchmark generated from python API
(set-info :status unknown)
(declare-fun |activation-2:p1-open-rmw-3| () (_ BitVec 32))
(assert
 (let (($x1196 (and (distinct (_ bv0 32) |activation-2:p1-open-rmw-3|) true)))
(let (($x1188 (= $x1196 $x1196)))
(not $x1188))))
(check-sat)
