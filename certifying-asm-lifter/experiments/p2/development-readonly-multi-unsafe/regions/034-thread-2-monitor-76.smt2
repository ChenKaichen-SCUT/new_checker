; benchmark generated from python API
(set-info :status unknown)
(declare-fun |activation-2:p1-open-rmw-3| () (_ BitVec 32))
(assert
 (let (($x456 (and (distinct (_ bv0 32) |activation-2:p1-open-rmw-3|) true)))
(let (($x1195 (= $x456 $x456)))
(not $x1195))))
(check-sat)
